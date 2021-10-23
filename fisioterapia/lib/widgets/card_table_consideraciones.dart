import 'dart:ui';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';


class CardTableConsideraciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard( imagen: NetworkImage('https://cutt.ly/wRaxoOK'), text: 'Si presenta opresión y/o dolor en el pecho',),
            _SingleCard( imagen: NetworkImage('https://cutt.ly/DRaxk1r'), text: 'Si presenta sensación de falta de aire',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: NetworkImage('https://cutt.ly/mRaxzWm'),  text: 'Si presenta sensación de desvanecimiento',),
            _SingleCard(imagen: NetworkImage('https://cutt.ly/URaxcdu'),  text: 'Si presenta tos severa',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: NetworkImage('https://cutt.ly/aRaxbvX'),  text: 'Si presenta dolor de cabeza',),
            _SingleCard(imagen: NetworkImage('https://cutt.ly/LRaxnBT'),  text: 'Si presenta fiebre por encima de 37 grados',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: NetworkImage('https://cutt.ly/BRaxQFt'),  text: 'Si presenta visión poco clara',),
            _SingleCard(imagen: NetworkImage('https://cutt.ly/iRaxW5t'),  text: 'Fatiga que no ceden con el descanso',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: NetworkImage('https://cutt.ly/lRaxTqr'),  text: 'Si presenta palpitaciones',),
            _SingleCard(imagen: NetworkImage('https://cutt.ly/mRaxT7l'),  text: 'Sudoración anormal excesiva',),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final String text;
  final NetworkImage imagen;

  const _SingleCard({Key? key, required this.imagen, required this.text,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      highlightColor: Colors.red,
      child: _CardBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: this.imagen, fit: BoxFit.cover, height: 120, width: double.infinity,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                this.text, 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: DeliveryColors.background, 
                  fontSize: 11
                ),
              ),
            )
          ],
        ),
      ),
    );


  }
}



class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(15),
      child: ClipRRect( //Corta cualquier cosa que se salga del contenedor
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              // color: Color.fromRGBO(62, 66, 107, 0.7),
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20)
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}