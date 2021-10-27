import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/providers/saturacion_frecuencia_provider.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/colors.dart' as color;

class HistorialFrecuenciaSaturacion extends StatefulWidget {

  @override
  State<HistorialFrecuenciaSaturacion> createState() => _HistorialFrecuenciaSaturacionState();
}

class _HistorialFrecuenciaSaturacionState extends State<HistorialFrecuenciaSaturacion> {

  final prefs = new PreferenciasUsuario();


  @override
  Widget build(BuildContext context) {

    // final saturacion_frecuencia = Provider.of<SaturacionFrecuenciaProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10, right: 30, left: 30),
            child: ListView(
              physics: BouncingScrollPhysics(),
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
                // SizedBox(height: 10,),
                Text('Historial de saturación de oxígeno y frecuencia cardiáca',
                  style: TextStyle(
                    fontSize: 22,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 30,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ANTES',
                      style: TextStyle(
                        fontSize: 22,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text('Saturación de Oxigeno:',
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageTitle,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 90,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: color.AppColor.gradientFirst.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.46),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ]
                          ),
                          
                          child: Text(
                            '${prefs.saturacion_antes.toString()} %',
                            style: TextStyle(
                              color: Colors.white, fontSize: 22, 
                            ),
                            textAlign: TextAlign.center, ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Frecuencia Cardiáca:',
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageTitle,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(width: 36,),
                        Container(
                          width: 90,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: color.AppColor.gradientFirst.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.46),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ]
                          ),
                          
                          child: Text(
                            '${prefs.frecuencia_antes.toString()}', 
                            style: TextStyle(
                              color: Colors.white, fontSize: 22, 
                            ),
                            textAlign: TextAlign.center, ),
                        ),
                      ],
                    ),


                  ],
                ),

                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DESPUÉS',
                      style: TextStyle(
                        fontSize: 22,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text('Saturación de Oxigeno:',
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageTitle,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: 90,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: color.AppColor.gradientFirst.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.46),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ]
                          ),
                          
                          child: Text(
                            '${prefs.saturacion_despues.toString()} %',
                            style: TextStyle(
                              color: Colors.white, fontSize: 22, 
                            ),
                            textAlign: TextAlign.center, ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Frecuencia Cardiáca:',
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageTitle,
                            fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(width: 36,),
                        Container(
                          width: 90,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: color.AppColor.gradientFirst.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.46),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(4, 4), // changes position of shadow
                              ),
                            ]
                          ),
                          
                          child: Text(
                            '${prefs.frecuencia_despues.toString()}', 
                            style: TextStyle(
                              color: Colors.white, fontSize: 22, 
                            ),
                            textAlign: TextAlign.center, ),
                        ),
                      ],
                    ),


                  ],
                ),

                
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}