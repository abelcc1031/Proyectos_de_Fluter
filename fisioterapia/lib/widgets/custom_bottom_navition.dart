import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/providers/ui_provider.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomBottonNavigation extends StatefulWidget {

  @override
  _CustomBottonNavigationState createState() => _CustomBottonNavigationState();
}

class _CustomBottonNavigationState extends State<CustomBottonNavigation> {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(

      onTap: (int i) => uiProvider.selectedMenuOpt = i,

      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      // backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      backgroundColor: DeliveryColors.background,

      currentIndex: currentIndex,

      items: [
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.principal,),
          label: 'Principal',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.ejercicios),
          label: 'Ejercicios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}