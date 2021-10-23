
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/widgets/widgets.dart';

import 'package:fisioterapia/providers/ui_provider.dart';
import 'package:fisioterapia/theme/theme.dart';



class MenuPrincipalScreen extends StatelessWidget {

  // final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    // prefs.ultimaPagina = 'menu_principal_screen';

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: DeliveryColors.background,
        title: FutureBuilder<User?>(
          future: Auth.instance.user,
          builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
            if(snapshot.hasData){
              final user = snapshot.data;
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Hola' + ' ' +
                      _getNombre(user?.displayName),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, 
                          fontWeight: FontWeight.w400,
                        ),
                    ),
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
 
      ),


      body: _BodyMenuPrinicipal(),

      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
  String _getNombre(String? displayName) {
    final List<String>? nombre = displayName!.split(" ");
    String primerNombre = "";
    if(nombre!.length>0){
      primerNombre = nombre[0];
    }
    

    return primerNombre;

  }
}

class HomeBodyMenu extends StatelessWidget {
  const HomeBodyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Background
        BackgroundImage(), 

        // Home Body
        _HomeBody(),
      ],
    );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [


          // Card Table
          CardTable(),

        ],
      ),
    );
  }
}


class _BodyMenuPrinicipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    
    // Cambiar para mostrar la  pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    switch( currentIndex ) {
      
      case 0:
        return HomeBodyMenu();
      case 1:
        return NivelEjercicios();
      case 2:
        return PerfilScreen();
      default:
        return HomeBodyMenu();
    } 
  }
}