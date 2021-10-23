import 'package:flutter/material.dart';


class NotificationsService {
  
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    if(message == 'EMAIL_EXISTS'){
      message = 'EL CORREO YA EXISTE';
    }
    if(message == 'INVALID_PASSWORD'){
      message = 'CONTRASEÑA INVALIDA';
    }
    if(message == 'EMAIL_NOT_FOUND'){
      message = 'CORREO NO ENCONTRADO';
    }

    final snackBar = new SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 20,), textAlign: TextAlign.center,),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
    

  }
}