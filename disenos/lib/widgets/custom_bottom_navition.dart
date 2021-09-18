import 'package:flutter/material.dart';


class CustomBottonNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      // currentIndex: 2,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined,),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: InkWell( //Eliminar el inwell, solo lo puse de prueba
            onTap: () {Navigator.pushNamed(context, 'basic_design');},
            child: Icon(
              Icons.pie_chart_outline_outlined
            )
          ),
          label: 'Gráfica',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Usuario',
        ),
      ],
    );
  }
}