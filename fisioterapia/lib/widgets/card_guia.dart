
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


class CardGuia extends StatefulWidget {


  @override
  _CardGuiaState createState() => _CardGuiaState();
}

class _CardGuiaState extends State<CardGuia> {
  // double height, width;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ImagenGuia(height: height),
          DescripcionGuia(height: height),
          

          PlayGuia(height: height, width: width)

        ],
     ),
   );
  }
}

class PlayGuia extends StatelessWidget {
  const PlayGuia({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: height * .5 - (width * .34),
      left: width * .35,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          boxShadow: [
            boxShadow2,
          ],
        ),
        height: width * .3,
        width: width * .3,
        child: Icon(
          CustomIcons.play, 
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class ImagenGuia extends StatelessWidget {
  const ImagenGuia({
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
            height: height * .5,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.red, 
              
            ),

            child: Image(
              image: AssetImage(
                'assets/guia_uso.png',
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          
        ],
      ),
    );
  }
}

class DescripcionGuia extends StatelessWidget {
  const DescripcionGuia({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .6,
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
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            Text(
              'Guía de uso del App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: DeliveryColors.background,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Sint aliqua id pariatur do ullamco mollit exercitation deserunt. Sint aliqua id pariatur do ullamco mollit exercitation deserunt.  Sint aliqua id pariatur do ullamco mollit exercitation deserunt.  Do nisi in aliqua aute magna sunt nostrud aliquip veniam. Et quis qui enim ut exercitation exercitation esse.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 60,),
            Center(
              child: InkWell(
                onTap: () {},
                splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                highlightColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      boxShadow2
                    ],
                    color: DeliveryColors.background,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    child: Text(
                      'PLAY',
                      style: TextStyle(color: DeliveryColors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}