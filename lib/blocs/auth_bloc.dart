import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pujapurohit/services/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc {
  final authService = Auth();
  final googleSignIn = GoogleSignIn(scopes : ['email']);

  Stream<User?> get currentUser => authService.currentUser;

  loginGoogle() async {
    try {
      Future<GoogleSignInAccount?>  googleUser () async  { print("googleuserinit") ; return await googleSignIn.signIn();  } ;
      GoogleSignInAuthentication googleAuth = await () async { print("signinauth"); return await googleUser().then((value) {   return value!.authentication;});}();
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
      );
       
      final result = await authService.signInWithCredentials(credential);
      debugPrint("username");
      debugPrint('${result.user?.displayName}');
      debugPrint("username");

    } catch(error) {
      debugPrint(error.toString());
    }

  }
  logout () {
    authService.logout();
  }
}
