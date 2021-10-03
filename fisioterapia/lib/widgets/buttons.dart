import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final Color colorTexfield;
  final Color colorIcon;
  final Color colorLabelText;

  const Buttons({Key? key, required this.labelText, required this.icon, required this.colorTexfield, required this.colorIcon, this.colorLabelText = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {}, 
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(
              this.icon, 
              size: 18,
              color: this.colorIcon,
            ),
            SizedBox(width: 20,),
            Text(
              this.labelText, 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: this.colorLabelText,
              ),
            ),
          ],
        ), 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(this.colorTexfield),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:20, vertical: 14)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        ),
      ),
    );
  }
}