import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
  static final background = Color(0xFF241e38);
  static final borders = Color(0xFF5F5080);
  static final gradientFirst = Color(0xff0f17ad);
  static final gradientSecond = Color(0xFF302f51);
  // static final borders = Color(0xFF0049a8);
}

final boxShadow2 = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 4,
  blurRadius: 7,
  offset: Offset(0, 3), // changes position of shadow
);

final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple,
];


final borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DeliveryColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);


final borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);


final borderBackground = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: DeliveryColors.borders,
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
    border: borderLight,
    enabledBorder: borderLight,
    labelStyle: TextStyle(color: DeliveryColors.purple),
    focusedBorder: borderLight,
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
    border: borderDark,
    enabledBorder: borderDark,
    contentPadding: EdgeInsets.zero,
    focusedBorder: borderDark,
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