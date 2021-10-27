import 'dart:convert';

import 'package:fisioterapia/screens/list_videos_screen1.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart' as color;

class NivelEjercicios extends StatefulWidget {
  NivelEjercicios({Key? key}) : super(key: key);

  @override
  _NivelEjerciciosState createState() => _NivelEjerciciosState();
}

class _NivelEjerciciosState extends State<NivelEjercicios> {

  List info = [];

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,

            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        
        child: Column(
          children: [

           Container(// cabecera Legs Toning
              padding: EdgeInsets.only(top: 40, left: 30, right: 38),
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      InkWell(
                        // onTap: () {Get.back();},
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 15,//20
                         color: color.AppColor.secondPageIconColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: (){
                          Auth.instance.logOut(context);
                        },
                        child: Icon(Icons.info_outline, size: 15,
                         color: color.AppColor.secondPageIconColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('Ejercicios Respiratorios',
                    style: TextStyle(
                      fontSize: 25,
                      color: color.AppColor.secondPageTitleColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ), SizedBox(width: 5,),
                            Text(
                              '16 min',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),

                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.blueAccent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.handyman_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ), SizedBox(width: 5,),
                            Text(
                              'Banda de resistencia',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),

                      )
                    ],
                  ),

                  
                ],
              ),
            ),

            Expanded( // Lista de videos
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  )
                ),

                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 10,),
                    NivelTarget(image: 'https://cutt.ly/nRyXunN', nivel: 'Nivel 1', categoria: 'Ejercicios sentados',rutaLista: 'utilidades_sentados_screen',),
                    // NivelTarget(image: 'https://cutt.ly/nRyXunN', nivel: 'Nivel 1', categoria: 'Ejercicios sentados',rutaLista: 'utilidades_sentados_screen',),
                    NivelTarget(image: 'https://cutt.ly/KRyXkbA', nivel: 'Nivel 2', categoria: 'Ejercicios boca arriba',rutaLista: 'utilidades_echados_screen',),
                    NivelTarget(image: 'https://cutt.ly/ZRyXRVa', nivel: 'Nivel 3', categoria: 'Ejercicios parados',rutaLista: 'utilidades_parado_screen',),
                    SizedBox(height: 50,),

                  ],
                ),
              )
            )


          ],
        ),
     ),
    );
  }
}

class NivelTarget extends StatelessWidget {
  final String image;
  final String nivel;
  final String categoria;
  final String rutaLista;

  const NivelTarget({
    Key? key, required this.image, required this.nivel, required this.categoria, required this.rutaLista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, this.rutaLista);
      },
      child: Container( // Tarjeta con imagen
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
              height: 80,
              // color: Colors.redAccent.withOpacity(0.2),
              margin: EdgeInsets.only(left: 120, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
    
                
                children: [
                  Text(
                    this.nivel,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                  SizedBox(height: 10,),
                  RichText(text: TextSpan(
                    text: this.categoria,
                    style: TextStyle(
                      color: color.AppColor.homePageTitle.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  )),
                ],
              ),
            ),
    
    
          ],
        ),
      ),
    );
  }
}