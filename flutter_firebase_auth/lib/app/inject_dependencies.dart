import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_firebase_auth/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:flutter_firebase_auth/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_firebase_auth/app/domain/repositories/sign_up_repository.dart';
import 'package:flutter_meedu/flutter_meedu.dart';


void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      FirebaseAuth.instance
      ),
  );
  Get.i.lazyPut<SingUpRepository>(
    () => SingUpRepositoryImpl(
      FirebaseAuth.instance
    ),
  );
  
}