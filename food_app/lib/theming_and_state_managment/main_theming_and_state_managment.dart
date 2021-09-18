import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/login/login_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/splash/splash_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';
import 'package:google_fonts/google_fonts.dart';
 
void main() => runApp(MainThemingAndStateManagment());
 
class MainThemingAndStateManagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _borderLight = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: DeliveryColors.veryLightGrey,
        width: 2,
        style: BorderStyle.solid,
      ),
    );

    final _borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: DeliveryColors.grey,
        width: 2,
        style: BorderStyle.solid,
      ),
    );

    final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: DeliveryColors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
            fontSize: 20,
            color: DeliveryColors.purple,
            fontWeight: FontWeight.bold,
           ),
        ),
      ),
      canvasColor: DeliveryColors.white,
      accentColor: DeliveryColors.purple,
      bottomAppBarColor: DeliveryColors.veryLightGrey,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple,
        displayColor: DeliveryColors.purple,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderLight,
        enabledBorder: _borderLight,
        labelStyle: TextStyle(color: DeliveryColors.purple),
        focusedBorder: _borderLight,
        contentPadding: EdgeInsets.zero,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.lightGrey,
          fontSize: 10,
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.purple,
      ),
    );


    final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: DeliveryColors.purple,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
            fontSize: 20,
            color: DeliveryColors.white,
            fontWeight: FontWeight.bold,
           ),
        ),
      ),
      bottomAppBarColor: Colors.transparent,
      canvasColor: DeliveryColors.grey,
      scaffoldBackgroundColor: DeliveryColors.dark,
      accentColor: DeliveryColors.white,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.green,
        displayColor: DeliveryColors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        enabledBorder: _borderDark,
        contentPadding: EdgeInsets.zero,
        focusedBorder: _borderDark,
        labelStyle: TextStyle(color: DeliveryColors.white),
        fillColor: DeliveryColors.grey,
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.white,
          fontSize: 10,
        ),
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.white,
      ),
    );

    // Comienzo de material app */////////////

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: SplashScreen()
    );
  }
}

// 2.05:34