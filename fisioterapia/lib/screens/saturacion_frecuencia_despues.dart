
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/providers/saturacion_frecuencia_provider.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../theme/colors.dart' as color;


class SaturacionFrecuenciaDespues extends StatefulWidget {

  @override
  State<SaturacionFrecuenciaDespues> createState() => _SaturacionFrecuenciaDespuesState();
}

class _SaturacionFrecuenciaDespuesState extends State<SaturacionFrecuenciaDespues> {

  final prefs = new PreferenciasUsuario();

  late int _saturacionDespues;
  late int _frecuenciaDespues;


  @override
  void initState() {
    super.initState();
    _saturacionDespues = prefs.saturacion_despues;
    _frecuenciaDespues = prefs.frecuencia_despues;
  }
  

  final firebase = FirebaseFirestore.instance;

  
  Future<User?>guardarFrecuenciaDespues(BuildContext _, AsyncSnapshot<User?> snapshot) async{
    try {
      if(snapshot.hasData) {
        final usuario = snapshot.data;
        print(usuario?.displayName);
        await firebase
        .collection("/Usuario/${usuario?.email}/frecuencia/")
        .doc('medicion_frecuencia_despues')
        .set({
          'frecuencia_despues': frecuencia_despues,

        });
        
      }
    }catch(e) {
      print(e);
    }

  }


  Future<User?>guardarSaturacionDespues(BuildContext _, AsyncSnapshot<User?> snapshot) async{
    
    try {
      if(snapshot.hasData) {
        final usuario = snapshot.data;
        print(usuario?.displayName);
        await firebase
        .collection("/Usuario/${usuario?.email}/saturacion/")
        .doc('medicion_saturacion_despues')
        .set({
          'saturacion_despues': saturacion_despues,

        });
        
      }
    }catch(e) {
      print(e);
    }
  }
  var frecuencia_despues;
  var saturacion_despues;






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
                Text('Medición de la saturación de oxígeno y la frecuencia cardiáca',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 30,),

                Container(

                  child: Column(

                    children: [
                      Text('Frecuencia cardiáca', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Container(
                            // color: Colors.red,
                            child: FutureBuilder<User?>(
                              future: Auth.instance.user,
                              builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
                                if(snapshot.hasData){
                                  final user = snapshot.data;
                                  print(user?.displayName);
                                  return SleekCircularSlider(
                                    appearance: CircularSliderAppearance(),
                                    initialValue: _frecuenciaDespues.toDouble(),
                                    onChange: (double value){
                                      print(value);
                                      frecuencia_despues = value.toInt() + 1;
        
                                      guardarFrecuenciaDespues(_, snapshot);
                                      prefs.frecuencia_despues = frecuencia_despues;
                                    },
                                  );
        
                                }else if(snapshot.hasError){
                                  return Center(
                                    child: Text('Network error'),
                                  );
                                }
                                return Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: 20,),

                Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Text('Saturación de oxígeno', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
        
                          Container(
                            // color: Colors.red,
                            child: FutureBuilder<User?>(
                              future: Auth.instance.user,
                              builder:(BuildContext _ ,AsyncSnapshot <User?> snapshot){
                                if(snapshot.hasData){
                                  final user = snapshot.data;
                                  print(user?.displayName);
                                  return SleekCircularSlider(
                                    appearance: CircularSliderAppearance(),
                                    initialValue: _saturacionDespues.toDouble(),
                                    onChange: (double value){
                                      print(value);
                                      saturacion_despues = value.toInt() + 1;
        
                                      guardarSaturacionDespues(_, snapshot);

                                      
                                      prefs.saturacion_despues = saturacion_despues;

                                    },
                                  );
        
                                }else if(snapshot.hasError){
                                  return Center(
                                    child: Text('Network error'),
                                  );
                                }
                                return Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        
        
                SizedBox(height: 5),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'historial_frecuencia_saturacion');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: color.AppColor.gradientFirst.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Ver Historial', style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                  ),
                )
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}