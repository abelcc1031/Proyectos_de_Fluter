import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisioterapia/screens/screens.dart';
import 'package:fisioterapia/services/services.dart';

import 'package:provider/provider.dart';


// class CheckAuthScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     // Como no necesitamos redibujar el widget nunca, entonces ponemos el listen en false, para que este escuchando ningun cambio que suceda en el authservices
//     final authService = Provider.of<AuthServices>(context, listen: false);
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: authService.readToken(),
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             if( !snapshot.hasData) {
//               return Text('');
//             }

//             if(snapshot.data == '') {
//               Future.microtask(() {
//                 Navigator.pushReplacement(context, PageRouteBuilder(
//                   pageBuilder: (_, __, ___,) => LoginScreen(),
//                   transitionDuration: Duration(seconds: 0),
//                   )
//                 );
//               });

//             }else {
//               Future.microtask(() {
//                 Navigator.pushReplacement(context, PageRouteBuilder(
//                   pageBuilder: (_, __, ___,) => MenuPrincipalScreen(),
//                   transitionDuration: Duration(seconds: 0),
//                   )
//                 );
//               });

//             }


//             return Container();
//           },
//         ),
//      ),
//    );
//   }
// }


// class CheckAuthScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if(snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator(),);
//           }else if(snapshot.hasData){
//             return MenuPrincipalScreen();
//           }else if(snapshot.hasError) {
//             return Center(child: Text('¡Algo salió mal!'),);
//           }else {
//             return LoginScreen();
//           }
//         }
//       ),
//     );
//   }
// }


class CheckAuthScreen extends StatefulWidget {
  CheckAuthScreen({Key? key}) : super(key: key);

  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    Auth.instance.user.then((User? user) {
      if(user != null) {
        Navigator.pushReplacementNamed(context, 'menu_principal_screen');

      }else {
        Navigator.pushReplacementNamed(context, 'login_screen');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(

        ),
      ),
    );
  }
}