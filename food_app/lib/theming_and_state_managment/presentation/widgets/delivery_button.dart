import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';

class DeliveryButton extends StatelessWidget {

  final VoidCallback ontap;
  final String text;
  final EdgeInsets padding;

  const DeliveryButton({
    Key? key, 
    required this.ontap, 
    required this.text, 
    this.padding = const EdgeInsets.all(14.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,  
            colors: deliveryGradients,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}