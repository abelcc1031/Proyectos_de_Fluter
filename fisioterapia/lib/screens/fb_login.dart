import 'package:fisioterapia/providers/facebook_login_controller.dart';
import 'package:fisioterapia/providers/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacebookLoginPage extends StatefulWidget {
  FacebookLoginPage({Key? key}) : super(key: key);

  @override
  _FacebookLoginPageState createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook login'),
        backgroundColor: Colors.redAccent,
      ),
      body: loginUi(),
    );
      

  }

  loginUi() {
    return Consumer<FacebookSignIncontroller>(
      builder: (context, model, child) {
        if(model.userData != null) {
          return Center(child: loggedInUi(model),);
        }
        else {
          return loginControls(context);
        }
      }
    );
  }

  loggedInUi(FacebookSignIncontroller model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userData!["picture"]["data"]["url"] ?? '').image,
          radius: 50,
        ),
        Text(model.userData!["name"] ?? ''),
        Text(model.userData!["email"]),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Provider.of<FacebookSignIncontroller>(context, listen: false).logOut();
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
              Provider.of<FacebookSignIncontroller>(context, listen: false).login();
            },
          ),

        ],
      ),
    );
  }
}

