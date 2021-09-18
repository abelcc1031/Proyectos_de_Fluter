import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/app/domain/inputs/sing_up.dart';
import 'package:flutter_firebase_auth/app/domain/repositories/sign_up_repository.dart';

class SingUpRepositoryImpl implements SingUpRepository {

  final FirebaseAuth _auth;

  SingUpRepositoryImpl(this._auth);

  @override
  Future<SingUpResponse> register(SingUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email, 
        password: data.password,
      );

      await userCredential.user!.updateDisplayName(
        "${data.name} ${data.lastname}",
      );

      return SingUpResponse(null, userCredential.user!);
    } on FirebaseAuthException  catch (e) {
      return SingUpResponse(e.code, null);
    }
  }
  
}