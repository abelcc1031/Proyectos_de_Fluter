import 'package:flutter/material.dart';


class PageTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Fisioterapia Respiratoria', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            SizedBox(height: 10,),
            // Text('Classify this transaction into a particular category', style: TextStyle(fontSize: 16, color: Colors.white),),
          ],
        ),
      );
  }
}