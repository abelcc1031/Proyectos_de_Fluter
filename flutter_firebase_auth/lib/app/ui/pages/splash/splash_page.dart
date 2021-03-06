import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;

final splashProvider = SimpleProvider(
  (_) => SplashController(),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider, 
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if(routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __) {
        return const Scaffold(
          body: Center(
            child:  CircularProgressIndicator(),
          ),
          
        );
      }
    );
  }
}


  
