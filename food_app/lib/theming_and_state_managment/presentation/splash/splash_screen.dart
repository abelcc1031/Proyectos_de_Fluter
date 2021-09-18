import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/login/login_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients, 
          ),
         ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/delivery/logo_delivery.png',
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              'Delivery App', 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                color: DeliveryColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}