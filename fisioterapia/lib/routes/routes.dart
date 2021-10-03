import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  
  return <String, WidgetBuilder> {
    'login_screen' : ( _ ) => LoginScreen(),
    'menu_principal_screen' : (_) => MenuPrincipalScreen(),
    'nav_drawer' : (_) => NavDrawer(),
    'card_pulsimetro' : (_) => CardPulsimetro(),
    'card_guia' : (_) => CardGuia(),
    'card_fisioterapueta' :(_) => CardFisioterapeuta(),
  };
}

        
