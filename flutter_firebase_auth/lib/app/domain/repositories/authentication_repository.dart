

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  // En el caso que el get user retorne un valor nulo, quire decir que no tenemos una sesion activa en el dispositivo
  Future<User?> get user;
}