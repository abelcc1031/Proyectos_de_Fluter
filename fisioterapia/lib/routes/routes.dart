import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  
  return <String, WidgetBuilder> {
    
    'card_fisioterapueta'          : (_) => CardFisioterapeuta(),
    'card_guia'                    : (_) => CardGuia(),
    'card_pulsimetro'              : (_) => CardPulsimetro(),
    'perfil_screen'                : (_) => PerfilScreen(),

    'list_videos_screen1'           : (_) => ListVideosScreen1(),
    'list_videos_screen2'           : (_) => ListVideosScreen2(),
    'list_videos_screen3'           : (_) => ListVideosScreen3(),
    'nivel_ejercicios_screen'      : (_) => NivelEjercicios(),

    'login_screen'                 : (_) => LoginScreen(),
    'menu_principal_screen'        : (_) => MenuPrincipalScreen(),

    'nav_drawer'                   : (_) => NavDrawer(),
  };
}

        
