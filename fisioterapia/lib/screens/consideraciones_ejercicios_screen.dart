
import 'package:fisioterapia/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/widgets/widgets.dart';

import 'package:fisioterapia/providers/ui_provider.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:fisioterapia/theme/colors.dart' as color;



class ConsideracionesEjercicios extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: _BodyMenuPrinicipal(),

    );
  }
}

class HomeBodyMenuConsideraciones extends StatelessWidget {
  const HomeBodyMenuConsideraciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Background
        BackgroundImage(), 

        // Home Body
        SafeArea(child: _HomeBodyConsideraciones()),
      ],
    );
  }
}

class _HomeBodyConsideraciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [

          Container(
            // color: Colors.green,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.AppColor.homePageContainerTextSmall,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(CustomIcons.back, color: DeliveryColors.background, size: 13,),
              )
            )
          ),

          Container(
            // color: Colors.red,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 12),
            child: Text(
              'Consideraciones para dejar de realizar los ejercicios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color.AppColor.secondPageTitleColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Card Table
          CardTableConsideraciones(),

          SizedBox(height: 20,),

          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),

            ),
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'SI PRESENTAS ALGUNAS DE ESTAS SENSACIONES, CONSULTAR A SU MÉDICO DE CONFIANZA',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          SizedBox(height: 40,),

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
        return HomeBodyMenuConsideraciones();
      case 1:
        return NivelEjercicios();
      case 2:
        return PerfilScreen();
      default:
        return HomeBodyMenuConsideraciones();
    } 
  }
}