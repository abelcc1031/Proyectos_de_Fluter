import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  // const SliderPage({ Key? key }) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider, 
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor) { //Recibe el valor que tiene ese slider
        setState(() {
          _valorSlider = valor;
        });
      } 
    );
  }

  // Widget _checkBox() {
  //   return Checkbox(
  //     value: _bloquearCheck,
  //     onChanged: (valor) {
  //       setState(() {
  //         _bloquearCheck = valor!;
  //       });

  //     }
  //   );
  // }
  Widget _checkBox() {

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor!;
        });

      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });

      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://www.kindpng.com/picc/m/14-149986_batman-png-clipart-batman-png-transparent-png.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }


}