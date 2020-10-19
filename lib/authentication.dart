
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';


class MyAuthentication  {



  FirebaseAuth auth = FirebaseAuth.instance;

  void signIn(String Email,String Password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email,
        password: Password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUp(String Email,String Password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
    }  on FirebaseAuthException catch (e) {
    if (e.code == Text('weak-password').toString()) {
    Text('The password provided is too weak.');
    } else if (e.code == Text('email-already-in-use').toString()) {
    Text('The account already exists for that email.');
    }
    } catch (e) {
    print(e);
    }
    // return Text('Account Created!!!');
  }

  void signOut() async{
    await FirebaseAuth.instance.signOut();
  }


}