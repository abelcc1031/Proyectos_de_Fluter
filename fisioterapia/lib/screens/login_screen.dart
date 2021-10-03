
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:fisioterapia/widgets/textField.dart';
import 'package:fisioterapia/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background
          Background(),
          

          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Logo(),
                  PageTitle(),
                  SizedBox(height: 15,),
                  InputFields(),
                  ButtonLogin(),
                  SizedBox(height: 30,),
                  Buttons(icon: CustomIcons.google, labelText: 'Continuar con Gmail', colorTexfield: Colors.white, colorIcon: Colors.redAccent, colorLabelText: DeliveryColors.background,),
                  Buttons(icon: CustomIcons.facebook, labelText: 'Continuar con Facebook', colorTexfield: Colors.blue, colorIcon: Colors.white,),
                ],
              ),
            ],
          ),
          
        ],
      ),

   );
  }
}



// Logo de la aplicación

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200,),
          Image(
            width: 100,
            image: AssetImage('assets/logo.png'),
          ),
          
        ],
      ),
    );
  }
}


// Boton de Login
class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      child: ElevatedButton(
        onPressed: () { Navigator.pushNamed(context, 'menu_principal_screen');}, 
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Iniciar Sesión', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: DeliveryColors.white,
              ),
            ),
          ],
        ), 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(DeliveryColors.green),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:20, vertical: 12)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        ),
      ),
    );
  }
}
