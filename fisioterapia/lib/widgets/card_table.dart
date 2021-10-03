import 'dart:ui';
import 'package:flutter/material.dart';


class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard( imagen: AssetImage('assets/pulsimetro.png'), text: 'Guía del pulsímetro', ruta: 'card_pulsimetro',),
            _SingleCard( imagen: AssetImage('assets/ejercicios.png'), text: 'Ejercicios respiratorios', ruta: 'card_pulsimetro',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: AssetImage('assets/recomendaciones.png'),  text: 'Recomendaciones para los ejercicios', ruta: 'card_pulsimetro',),
            _SingleCard(imagen: AssetImage('assets/manual.png'),  text: 'Guía de uso del App', ruta: 'card_guia',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(imagen: AssetImage('assets/contacto.png'),  text: 'Fisioterapeuta', ruta: 'card_fisioterapueta',),
            _SingleCard(imagen: AssetImage('assets/consideraciones.png'),  text: 'Consideraciones para detener los ejercicios', ruta: 'card_pulsimetro',),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final String text;
  final AssetImage imagen;
  final String ruta;

  const _SingleCard({Key? key, required this.imagen, required this.text, required this.ruta}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {Navigator.pushNamed(context, this.ruta);},
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
                  color: Colors.white, 
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
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}