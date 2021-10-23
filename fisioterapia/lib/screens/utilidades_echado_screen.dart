import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fisioterapia/theme/colors.dart' as color;


class UtilidadesEchadoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.red,
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [

            Container(
              // color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

            Container(
              // color: Colors.red,
              alignment: Alignment.center,
              // padding: EdgeInsets.only(left: 30),
              child: Text(
                'Ejercicios boca arriba',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: color.AppColor.homePageTitle,
                ),
              ),
            ),
            SizedBox(height: 30,),
            InfoUtilidadesEchado(info: 'Para los siguientes ejercicios se necesitan una camilla o una cama con superficie firme o pisos de microporoso..',),
            SizedBox(height: 30,),
            InfoUtilidadesEchado(info: 'Puede realizar los siguientes ejercicios 2 veces al dia, 2 series de 10 repeticiones.',),
            SizedBox(height: 30,),

            Container(
              // color: Colors.red,
              height: 250,
              child: Image(
                image: NetworkImage('https://cutt.ly/ZRiCGIO'),
              )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,),
              child: ElevatedButton(
                onPressed: () { Navigator.pushReplacementNamed(context, 'list_videos_screen2');}, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continuar', 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: DeliveryColors.white,
                      ),
                    ),
                  ],
                ), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color.AppColor.gradientFirst.withOpacity(0.8),),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:20, vertical: 12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                ),
              ),
            ),
            
          ],
        ),
      ),
   );
  }
}

class InfoUtilidadesEchado extends StatelessWidget {
  final String info;
  const InfoUtilidadesEchado({
    Key? key, required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Icon(
            Icons.check_circle, 
            color: color.AppColor.gradientFirst.withOpacity(0.8),
            size: 30,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 30),
            // color: Colors.red,
            child: Text(
              this.info,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.justify,
            ),
          )
        )
      ]
    );
  }
}