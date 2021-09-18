

import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:flutter_firebase_auth/app/ui/pages/login/login_page.dart';
import 'package:flutter_firebase_auth/app/ui/pages/register/register_page.dart';
import 'package:flutter_firebase_auth/app/ui/pages/splash/splash_page.dart';
import 'routes.dart';


Map<String, Widget Function(BuildContext)> get appRoutes =>{
  Routes.SPLASH: (_) => const SplashPage(),
  Routes.LOGIN: (_) => const LoginPage(),
  Routes.HOME: (_) => Container(),
  Routes.REGISTER: (_) => const RegisterPage(),


};