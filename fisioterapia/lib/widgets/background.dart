import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BackgroundImage();
  }
}



class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          // Color.fromRGBO(28, 22, 53, 1),
          // Color.fromRGBO(28, 22, 53, 0.7),
          Color.fromRGBO(36, 30, 56, 1),
          Color.fromRGBO(36, 30, 56, 0.7),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(DeliveryColors.background, BlendMode.hardLight), 
          ),
        ),
      ),
    );

  }
}