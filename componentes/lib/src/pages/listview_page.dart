import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  // const ListPage({ Key? key }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Controlador del scroll de la lista
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState(); // Hace referencia a la clase state y la referencia
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fetchData();
      }
    });
  }

  // Se dispara cuando se destruya la pagina
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); // para prevenir fugas de memoria
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    // método que redibuja los elemementos que se encuentran en la lista
    // Renderiza los elementos conforme sean necesarios
    return RefreshIndicator(

      onRefresh: obtenerPagina1,

      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          //se crea el context, no lo estamos pasando como argumento
    
          final imagen = _listaNumeros[index];
    
          // Como la imagen lo descargamos de un recurso externo, lo mejor es utilizar un fadeinimage para tener un loading
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/200/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {

    setState(() {// posible solution
      final duration = new Duration(seconds: 2);
      new Timer(duration, () {
        _listaNumeros.clear();
        _ultimoItem++;
        _agregar10();
      });

      // return Future.delayed(duration);
      
    });
  }

  void _agregar10() {
    for (var i = 1; i < 11; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),

            ],
          ),
          SizedBox(height: 15.0,),
        ],
      );
      
      
    }else {
      return Container();
    }
  }
}
