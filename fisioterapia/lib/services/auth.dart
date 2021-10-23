// import 'package:aplicativo_new/widgets/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisioterapia/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/widgets.dart';

class Auth{
  Auth._internal();
  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<User?> get user async {
    return (await _firebaseAuth.currentUser);
  }


  Future<User?> loginByPassword(
    BuildContext context, {
      required String email,
      required String password,
    }) async {
      try{
        final  UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, 
          password: password
        );
        if(result.user != null){
          return result.user;
        }
        return null;
      }catch(e){
        print(e);
        return null;
      }
    }

  Map? userData;

  Future<User?> facebook()async{
    try {

      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ["public_profile", "email"],
      );
      if(result.status == LoginStatus.success) {
        print("Facebook login ok");
        final requestData = await FacebookAuth.instance.getUserData(
          fields: "email, name, picture",
        );
        userData = requestData;
        print(userData); 

        final AuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);

        final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);

        final user = authResult.user;

        print("Facebook username: ${user!.displayName}");

        return user;

      } else if(result.status == LoginStatus.cancelled){
        print("Facebook login cancelled");
      }else{
        print("Facebook login failed");
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }
  }


  Future<User?> google()async{

    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
        await googleUser!.authentication;

      final AuthCredential credential =GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

     final UserCredential result = 
     await _firebaseAuth.signInWithCredential(credential);

     final User? user = result.user;

     print('username : ${user?.displayName}');
     return user;

    } catch (e){
      print(e);
      return null;
    }
  }


  Future<void> logOut(BuildContext context)async{
    final String? providerId = (await user)?.providerData[0].providerId;
    print("providerId $providerId");
    switch (providerId){
      case "facebook.com":
        await FacebookAuth.instance.logOut();
        break;
      case "google.com":
        await _googleSignIn.signOut();
        break;
      case "password":
        break;
      case "phone":
        break;
    }
    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context, 'login_screen', (_)=>false
    );
  }
}

