import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDDLNT3DjLofhMMEbtWxGLwDS1kRWUr2iE';

  // Instanciamos el storage
  final storage = new FlutterSecureStorage();

  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String email, String  password) async {

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      'key' : _firebaseToken
    });


    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      // decodedResp['idToken'];
      return null;
    }else {
      return decodedResp['error']['message'];
    }
    
  }


  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> login(String email, String  password) async {

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https(_baseUrl, 'v1/accounts:signInWithPassword',{
      'key' : _firebaseToken
    });


    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      // decodedResp['idToken'];
      return null;
    }else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }


  // Verificar si tengo un token
  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}