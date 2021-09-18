import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  // const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el titulo de la tarjeta'),
            subtitle: Text('Aquí estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea que lo que quiero mostrarles')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(

      // Nos deberia ayudar a que nada de lo que esta de la tarjeta se salga del contenido de la misma
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://c.wallhere.com/photos/ce/b2/2071x1080_px_Chile_landscape_mountains_nature_panorama_Patagonia_water-991897.jpg!d'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover
            // Como la imagen debe ocupar el espacio que tiene
          ),
          // Image(
          //   image: NetworkImage('https://c.wallhere.com/photos/ce/b2/2071x1080_px_Chile_landscape_mountains_nature_panorama_Patagonia_water-991897.jpg!d'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea que poner')
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      // ClipRRect: Permite cortar cualquier cosa que se encuentre fuera de ese contenedor
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      ),
    );
  }
}