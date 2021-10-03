import 'package:fisioterapia/custom_icons.dart';
import 'package:flutter/material.dart';


class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Abel'), 
            accountEmail: Text('abelcc1031@gmail.com'),
            currentAccountPicture: CircleAvatar(
              // Utilizar FadeInImage
              child: ClipOval(
                child: Image.network(
                  'https://cutt.ly/bEDfkVw',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://cutt.ly/rEDfgN3',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          ListTile(
            leading: Icon(CustomIcons.saturacion),
            title: Text('Medición de saturación'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.ejercicios),
            title: Text('Ejercicios respiratorios'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.recomendacion),
            title: Text('Recomendaciones'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.guia),
            title: Text('Guía de uso'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.contacto),
            title: Text('Contacto'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CustomIcons.consideraciones),
            title: Text('Consideraciones'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(CustomIcons.salir),
            title: Text('Salir'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
