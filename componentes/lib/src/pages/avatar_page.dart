import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://pics.filmaffinity.com/Mr_Robot_Serie_de_TV-978107021-large.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://e00-elmundo.uecdn.es/blogs/elmundo/asesinoenserie/imagenes_posts/2017/10/22/189006_540x360.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200 ),
        ),
      ),
      
    );
  }
}