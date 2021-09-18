import 'package:flutter_firebase_auth/app/domain/inputs/sing_up.dart';

abstract class SingUpRepository {
  Future<SingUpResponse> register(SingUpData data);
}

