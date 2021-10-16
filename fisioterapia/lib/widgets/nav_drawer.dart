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
              child: ClipOval(
                child: FadeInImage(
                  image: NetworkImage('https://cutt.ly/ORiBMEJ'), 
                  // image: NetworkImage('https://cutt.ly/VEK3dGG'), 
                  placeholder: AssetImage('assets/background.jpg'),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
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
            leading: Icon(CustomIcons.principal),
            title: Text('Menu Principal'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'menu_principal_screen');
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.saturacion),
            title: Text('Medición de saturación'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'card_pulsimetro');
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.ejercicios),
            title: Text('Ejercicios respiratorios'),
            onTap: () {
              Navigator.pushNamed(context, 'nivel_ejercicios_screen');
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.recomendacion),
            title: Text('Recomendaciones'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.guia),
            title: Text('Guía de uso'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'card_guia');
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.contacto),
            title: Text('Contacto'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'card_fisioterapueta');
            },
          ),
          ListTile(
            leading: Icon(CustomIcons.consideraciones),
            title: Text('Consideraciones'),
            onTap: () {
              Navigator.pushNamed(context, 'facebook_login_page');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(CustomIcons.salir),
            title: Text('Salir'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'login_screen');
            },
          ),
        ],
      ),
    );
  }
}

