import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  // const HomePageTemp({Key? key}) : super(key: key);

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        // children: _crearItems()
        children: _crearItemsCorta()

      ),
    );
    
  }


  // Transformar el listado 'opciones' en un listado de Widgets
  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      // lista.add(tempWidget);
      // lista.add(Divider());

      lista..add(tempWidget)
           ..add(Divider());
    }
    return lista;
  }


  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {

      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

  }
}