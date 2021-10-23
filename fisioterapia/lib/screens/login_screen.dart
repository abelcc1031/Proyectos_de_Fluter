import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/custom_icons.dart';
import 'package:fisioterapia/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fisioterapia/providers/login_form_provider.dart';
import 'package:fisioterapia/services/services.dart';
import 'package:provider/provider.dart';

import 'package:fisioterapia/ui/input_decorations.dart';
import 'package:fisioterapia/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  // void _goTo(BuildContext context, User user) {
  //   if(user != null) {
  //     Navigator.pushReplacementNamed(context, 'menu_principal_screen');
  //   }else {
  //     print("Login failed");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 180 ),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Iniciar Sesión', style: TextStyle(fontSize: 30, color: Colors.black.withOpacity(0.7)) ),
                    SizedBox( height: 30 ),
                    
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm()
                    )
                    

                  ],
                )
              ),

              SizedBox( height: 50 ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, color: Colors.white.withOpacity(0.9) ),)
              ),
              SizedBox( height: 50 ),
            ],
          ),
        )
      )
   );
  }
}


class _LoginForm extends StatelessWidget {



  void _goTo(BuildContext context, User? user) {
    if(user != null) {
      Navigator.pushReplacementNamed(context, 'menu_principal_screen');
    }else {
      print("Login failed");
    }
  }

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      // color: Colors.deepOrange,
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'abelcc1031@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.email_outlined,
              ),
              onChanged: ( value ) => loginForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';

              },
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value ) => loginForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
                  
              },
            ),

            SizedBox( height: 30 ),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading 
                    ? 'Espere'
                    : 'Ingresar',
                  style: TextStyle( color: Colors.white ),
                )
              ),
              onPressed: loginForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthServices>(context, listen: false);
                
                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;

                
                // TODO: validar si el login es correcto
                final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

                if(errorMessage == null) {
                  Navigator.pushReplacementNamed(context, 'menu_principal_screen');
                }else {
                  // TODO: mostrar error en pantalla
                  // print(errorMessage);
                  NotificationsService.showSnackbar(errorMessage);
                  loginForm.isLoading = false;
                }

              }
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                // onPressed: () {
                //   final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                //   provider.googleLogin();
                // }, 
                onPressed: () async {
                  final user = await Auth.instance.google();
                  _goTo(context, user);
                }, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50)
                ),
                icon: Icon(CustomIcons.google, color: Colors.red[900],),
                label: Text('Continuar con Google'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                // onPressed: () {
                //   final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                //   provider.signInWithFacebook();
                // }, 
                onPressed: () async {
                  final user = await Auth.instance.facebook();
                  _goTo(context, user);
                }, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  primary: Colors.blueAccent[700],
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50)
                ),
                icon: Icon(CustomIcons.facebook, color: Colors.white,),
                label: Text('Continuar con Facebook'),
              ),
            ),
            

            // Buttons(icon: CustomIcons.google, labelText: 'Continuar con Gmail', colorTexfield: Colors.white, colorIcon: Colors.redAccent, colorLabelText: DeliveryColors.background,),
            // Buttons(icon: CustomIcons.facebook, labelText: 'Continuar con Facebook', colorTexfield: Colors.blue, colorIcon: Colors.white,),

          ],
        ),
      ),
    );
  }
}