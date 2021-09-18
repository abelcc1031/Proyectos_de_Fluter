import 'dart:ui';

import 'package:disenos/screens/basic_design.dart';
import 'package:flutter/material.dart';


class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(icon: Icons.border_all, color: Colors.blue, text: 'General',),
            _SingleCard(icon: Icons.car_rental, color: Colors.deepPurple, text: 'Transport',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.shop_sharp, color: Colors.pink, text: 'Shopping',),
            _SingleCard(icon: Icons.article, color: Colors.orange, text: 'Bill',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.movie, color: Colors.blue.shade700, text: 'Entertaiment',),
            _SingleCard(icon: Icons.local_grocery_store, color: Colors.green, text: 'Grocery',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.bike_scooter, color: Colors.indigo, text: 'Bicker',),
            _SingleCard(icon: Icons.shower, color: Colors.amber, text: 'Shower',),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({Key? key, required this.icon, required this.color, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            child: Icon(this.icon, size: 35, color: Colors.white,),
            radius: 30,
          ),
          SizedBox(height: 10,),
          Text(this.text, style: TextStyle(color: this.color, fontSize: 18),)
        ],
      ),
    );
  }
}



class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(15),
      child: ClipRRect( //Corta cualquier cosa que se salga del contenedor
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}