
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/share_prefs/preferencias_usuario.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


class CardFisioterapeuta extends StatefulWidget {


  @override
  _CardFisioterapeutaState createState() => _CardFisioterapeutaState();
}

class _CardFisioterapeutaState extends State<CardFisioterapeuta> {

  final prefs = new PreferenciasUsuario();
  
  // double height, width;
  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = 'card_fisioterapueta';

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: DeliveryColors.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text('Hola Abel',),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ImagenFisioterapeuta(height: height),
          DescripcionFisioterapeuta(height: height),

        ],
     ),
   );
  }
}



class ImagenFisioterapeuta extends StatelessWidget {
  const ImagenFisioterapeuta({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: DeliveryColors.background,
            height: height * .5,
            width: double.infinity,

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: [boxShadow2],
                      // color: Colors.red, 
                      image: DecorationImage(
                        image: AssetImage('assets/fisioterapeuta.png'),
                        fit: BoxFit.cover

                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 0
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 30,),
                      Text(
                        'Dra. Silvia Cardenas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Fisioterapeuta Respiratoria',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  )
                ],
              ),
            )
          ),
          
        ],
      ),
    );
  }
}

class DescripcionFisioterapeuta extends StatelessWidget {
  const DescripcionFisioterapeuta({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .45,
      decoration: BoxDecoration(
        boxShadow: [
          boxShadow2
        ],
        color: Colors.white, 
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            Text(
              'Contáctate con una especialista',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: DeliveryColors.background,
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [boxShadow2],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green,
                  ),
                  child: Icon(
                    CustomIcons.phone,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Celular',
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(7, 12, 17, 12),
                  decoration: BoxDecoration(
                    boxShadow: [boxShadow2],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.red,
                  ),
                  child: Icon(
                    CustomIcons.correo,
                    color: Colors.white,
                    size: 20.0,
                    semanticLabel: 'Correo',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [boxShadow2],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green,
                  ),
                  child: Icon(
                    CustomIcons.whatsapp,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Whatsapp',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [boxShadow2],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue.shade700,
                  ),
                  child: Icon(
                    CustomIcons.facebook,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Facebook',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


