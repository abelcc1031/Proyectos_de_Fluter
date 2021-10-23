import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Drawer(
      child: FutureBuilder<User?>(
        future: Auth.instance.user,
        builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
          if(snapshot.hasData){
            final user = snapshot.data;

            return ListView(
              padding:EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    user?.displayName ?? "No user Name Provider",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                      fontWeight: FontWeight.w400,
                    ),
                  ), 
                  accountEmail: Text(
                    user?.email ?? "No user Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: user?.photoURL != null ? FadeInImage(
                        image: NetworkImage(user?.photoURL ?? "No user Photo"),
                        placeholder: AssetImage('assets/loading.gif'),
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ): Image(image: NetworkImage('https://cutt.ly/4RzRbJs'))
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/portada.jpg'),
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
                    Navigator.pushNamed(context, 'guia_pulsimetro_screen');
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
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'recomendaciones_ejercicios_screen');
                  },
                ),
                ListTile(
                  leading: Icon(CustomIcons.guia),
                  title: Text('Guía de uso del App'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'guia_app_screen');
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
                    // Navigator.pushNamed(context, 'facebook_login_page');
                    // Navigator.pushNamed(context, 'facebook_login_page');
                    Navigator.pushNamed(context, 'consideracion_ejercicios_screen');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(CustomIcons.salir),
                  title: Text('Salir'),
                  onTap: () {
                    Auth.instance.logOut(context);
                  },
                ),
              ],
            );

          }else if(snapshot.hasError){
            return Center(
              child: Text('Network error'),
            );
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }),
      
      
      
    );
  }

  Widget _getAlias(String displayName) {
    final List<String>? tmp = displayName.split(" ");
    String alias = "";
    if(tmp!.length>0){
      alias = tmp[0][0];
      if(tmp.length == 3){
        alias += tmp[1][0];
      }
    }
    
    return Center(
      child: Text(
        alias,
        style: TextStyle(fontSize: 30),
      )
    );
  }
}

