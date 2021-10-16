import 'package:fisioterapia/providers/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social login'),
        backgroundColor: Colors.redAccent,
      ),
      body: loginUi(),
    );
      

  }

  loginUi() {
    return Consumer<GoogleSignInController>(
      builder: (context, model, child) {
        if(model.googleAccount != null) {
          return Center(child: loggedInUi(model),);
        }
        else {
          return loginControls(context);
        }
      }
    );
  }

  loggedInUi(GoogleSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Provider.of<GoogleSignInController>(context, listen: false).logOut();
          }
        ),

      ],
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: Image.asset('assets/google.png', width: 250,),
            onTap: () {
              Provider.of<GoogleSignInController>(context, listen: false).login();
            },
          ),
          GestureDetector(
            child: Image.asset('assets/facebook.png', width: 250,),
            onTap: () {
              Provider.of<GoogleSignInController>(context, listen: false).login();
            },
          ),

        ],
      ),
    );
  }
}

