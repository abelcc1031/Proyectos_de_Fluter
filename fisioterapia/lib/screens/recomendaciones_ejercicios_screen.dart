import 'dart:convert';

import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/screens/list_videos_screen1.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart' as color;

class RecomendacionEjercicios extends StatefulWidget {
  RecomendacionEjercicios({Key? key}) : super(key: key);

  @override
  _RecomendacionEjerciciosState createState() => _RecomendacionEjerciciosState();
}

class _RecomendacionEjerciciosState extends State<RecomendacionEjercicios> {

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [

            Container(// cabecera Legs Toning
              padding: EdgeInsets.only(top: 20, left: 30, right: 38),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        // color: Colors.green,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.AppColor.gradientFirst.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(CustomIcons.back, color: Colors.white, size: 13,),
                          )
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Recomendaciones para la realización de los ejercicios',
                    style: TextStyle(
                      fontSize: 22,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  
                ],
              ),
            ),

            SizedBox(height: 20,),

            Column(
              children: [
                SizedBox(height: 10,),
                TargetConsideraciones(image: 'https://cutt.ly/oRan6FZ', categoria: 'Elije un ambiente seguro y despejado que disminuya el riesgo a caidas.'),
                TargetConsideraciones(image: 'https://cutt.ly/PRamw28', categoria: 'Si tienes dificultad para movilizare, solicta apoyo de otra persona.'),
                TargetConsideraciones(image: 'https://cutt.ly/xRamrjV', categoria: 'Usar la escal de Borg modificada para controlar la intesidad de los ejercicios recomendados.'),
                SizedBox(height: 50,),

              ],
            ),



          ],
        ),
     ),
    );
  }
}

class TargetConsideraciones extends StatelessWidget {
  final String image;
  final String categoria;


  const TargetConsideraciones({
    Key? key, required this.image, required this.categoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container( // Tarjeta con imagen
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0),
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  "assets/card.jpg"
                ),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  offset: Offset(8, 10),
                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                ),
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(-1, -5),
                  color: color.AppColor.gradientSecond.withOpacity(0.3),
                ),
              ]
            ),
          ),
    
          Container(
            // height: 200,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(right: 190, bottom: 20,),
            decoration: BoxDecoration(
              // color: Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(
                  this.image
                ),
                // AssetImage(
                //   this.image
                // ),
                fit: BoxFit.cover,
              ),
            ),
          ),
    
          Container(
            width: double.maxFinite,
            height: 100,
            // color: Colors.redAccent.withOpacity(0.2),
            margin: EdgeInsets.only(left: 120, top: 7, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                RichText(text: TextSpan(
                  text: this.categoria,
                  style: TextStyle(
                    color: color.AppColor.homePageTitle.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                )),
              ],
            ),
          ),
    
    
        ],
      ),
    );
  }
}