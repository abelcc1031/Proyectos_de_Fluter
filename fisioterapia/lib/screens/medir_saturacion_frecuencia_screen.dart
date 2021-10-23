import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// class SleekSlider extends StatelessWidget {
//   //final String adr  // esto es la forma de recibir el id del documento firebse

//   //SleekSlider({required this.adr});

//   CollectionReference coleccion =
//       FirebaseFirestore.instance.collection('usuarios');

//   double valor = 0.5;
//   var saturacion;
//   var frecuencia;

//   var adr =
//       'usuario2'; // esto es el id del documento esto debe recibir con el codigo de arriba que esta comentado
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'flutter Firebase',
//         home: Scaffold(
//           appBar: AppBar(
//               title: Text(
//             'Ingrese su Saturación y Frecuencia cardiaca',
//             textAlign: TextAlign.center,
//           )),

//           body: Center(
//             child: Stack(
//               children: [
//                 Container(
//                   child: ListView(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(top: 4, bottom: 4),
//                         child: Text(
//                           'Medicion de la Saturación de oxigeno  y Frecuencia cardiaca',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 18, color: Colors.black),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 4, bottom: 4),
//                         child: Text(
//                           'Saturación',
//                           style: TextStyle(fontSize: 20, color: Colors.black45),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       Container(
//                         child: SleekCircularSlider(
//                           appearance: CircularSliderAppearance(
//                             size: 250,
//                             startAngle: 180,
//                             angleRange: 360,
//                             customWidths: CustomSliderWidths(
//                               progressBarWidth: 10,
//                             ),
//                             customColors: CustomSliderColors(
//                               hideShadow: true,
//                               trackColor: Colors.black,
//                               progressBarColor: Colors.pinkAccent,
//                               shadowMaxOpacity: 20,
//                             ),
//                           ),
//                           onChange: (value) {
//                             saturacion = value;
//                           },
//                           initialValue: 0,
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 4, bottom: 4),
//                         child: Text(
//                           'Frecuencia Cardiaca',
//                           style: TextStyle(fontSize: 20, color: Colors.black45),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       Container(
//                         child: SleekCircularSlider(
//                             max: 150,
//                             appearance: CircularSliderAppearance(
//                               size: 250,
//                               startAngle: 180,
//                               angleRange: 360,
//                               customWidths: CustomSliderWidths(
//                                 progressBarWidth: 10,
//                               ),
//                               customColors: CustomSliderColors(
//                                 hideShadow: true,
//                                 trackColor: Colors.black,
//                                 progressBarColor: Colors.pinkAccent,
//                                 shadowMaxOpacity: 20,
//                               ),
//                             ),
//                             initialValue: 0,
//                             onChange: (value) {
//                               frecuencia = value;
//                             },
//                             innerWidget: (percentage) {
//                               return Center(
//                                   child: Text(
//                                 '   ${percentage?.toInt()}  PRbpm',
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                 ),
//                               ));
//                             }),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           floatingActionButton: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text("Guardar informacion"),
//                         content: Text("Guardo con exito"),
//                         actions: <Widget>[
//                           ElevatedButton(
//                             child: Text(
//                               "CERRAR",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () {
//                               // Navigator.of(context).push(MaterialPageRoute(
//                               //   builder: (context) => historial(
//                               //     id: adr,
//                               //   ),
//                               // ));
//                             },
//                           )
//                         ],
//                       );
//                     });
//                 coleccion.doc(adr).set({
//                   'antiguosaturacion': saturacion.toInt(),
//                   'antiguofrecuencia': frecuencia.toInt()
//                 });
//               }),
//           // )
//         ));
//   }
// }


class MedirSaturacionFrecuenciaScreen extends StatefulWidget {

  @override
  State<MedirSaturacionFrecuenciaScreen> createState() => _MedirSaturacionFrecuenciaScreenState();
}

class _MedirSaturacionFrecuenciaScreenState extends State<MedirSaturacionFrecuenciaScreen> {
  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(),
    initialValue: 25,
    onChange: (double value){
      print(value);
    },
  );

  Widget slider1 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
     customColors: CustomSliderColors(trackColor: Colors.limeAccent,progressBarColors:
     [Colors.lightGreen, Colors.amberAccent],shadowMaxOpacity: 20.0),
     infoProperties: InfoProperties(topLabelText: 'Running..'),
    ),
    initialValue: 60,
    onChange: (double value){
      print(value);
    },
  );

  // Widget slider2 = SleekCircularSlider(
  //   appearance: CircularSliderAppearance(
  //     spinnerMode: true,
  //     size: 50.0,
  //     customWidths: CustomSliderWidths(trackWidth: 10.0,shadowWidth: 5.0),
  //   ),
  //   initialValue: 90,
  //   onChange: (double value){
  //     print(value);
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Sleek Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            slider,
            SizedBox(height: 5),
            slider1,
            SizedBox(height: 5,),
            // slider2

          ],
        ),
      ),
    );
  }
}