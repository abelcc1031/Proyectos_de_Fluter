import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/home/home_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/splash/splash_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';
import 'package:food_app/theming_and_state_managment/presentation/widgets/delivery_button.dart';

const logoSize = 45.0;
class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0; 
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -moreSize/2,
                  right: -moreSize/2,
                  height: width + moreSize,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.5,
                          1.0
                        ],  
                        colors: deliveryGradients,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(size.width / 2),
                      )
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).canvasColor,
                    radius: logoSize,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/delivery/logo_delivery.png',
                        color: Theme.of(context).accentColor,
                      ),
                      
                    ),
                  )
                ),
              ],
            ),  
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40,),
                    Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: "username" 
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).inputDecorationTheme.labelStyle!.color,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: 'password',
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: DeliveryButton(
              text: 'Login',
              ontap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}