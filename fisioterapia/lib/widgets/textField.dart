// import 'package:fisioterapia/widgets/background.dart';
import 'package:fisioterapia/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:fisioterapia/theme/theme.dart';

class InputFields extends StatefulWidget {
  InputFields({Key? key}) : super(key: key);

  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Input(labelText: 'Email', hintText: 'Ingrese Email', icon: CustomIcons.correo, tipoEntradaTexto: TextInputType.emailAddress,),
          SizedBox(height: 10,),
          Input(labelText: 'Password', hintText: 'Ingrese Password', icon: CustomIcons.nose, password: true,),
        ],
      ),
    );
  }
}


class Input extends StatelessWidget {

  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType tipoEntradaTexto;
  final bool password;

  const Input({Key? key, required this.labelText, required this.hintText, required this.icon, this.tipoEntradaTexto = TextInputType.text, this.password = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      keyboardType: this.tipoEntradaTexto,
      textCapitalization: TextCapitalization.sentences,
      obscureText: this.password,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white, fontSize: 12),
        fillColor: DeliveryColors.background,
        filled: true,

        contentPadding: EdgeInsets.all(0),

        border: borderDark,
        focusedBorder: borderBackground,
        labelText: this.labelText,
        hintText: this.hintText,
        prefixIcon: Icon(
          this.icon, 
          color: Colors.white,
          size: 16,
        ),

      ),
    );
  }
}
