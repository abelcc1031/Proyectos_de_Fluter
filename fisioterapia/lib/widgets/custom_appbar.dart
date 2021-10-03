import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        tooltip: 'Abrir el menú de navegación',
        onPressed: () {}, 
        icon: Icon(Icons.menu),
      ),
      title: Text('Hola Abel'),
    );
  }
}