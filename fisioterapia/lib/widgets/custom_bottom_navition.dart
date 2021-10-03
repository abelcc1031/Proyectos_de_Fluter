import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';


class CustomBottonNavigation extends StatefulWidget {

  @override
  _CustomBottonNavigationState createState() => _CustomBottonNavigationState();
}

class _CustomBottonNavigationState extends State<CustomBottonNavigation> {
  int _paginaPrincipal = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      // backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      backgroundColor: DeliveryColors.background,
      currentIndex: _paginaPrincipal,

      onTap: (index) {
        setState(() {
          _paginaPrincipal = index;
        });
      },

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