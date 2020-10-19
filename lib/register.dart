
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Register extends StatefulWidget {
  static const String id='register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String Email;
  String Password;
  bool _showPassword=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
        appBar: AppBar(
          title: Text(
            'Attendance',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Card(
            elevation: 20.0,
            color: Colors.indigoAccent,
            margin: EdgeInsets.only(left: 10.0, top: 150.0, right: 10.0,bottom: 150.0),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.white,),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      onChanged: (value){
                        setState(() {
                          Email=value;
                        });
                      },
                    )),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
               obscureText: !this._showPassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white,),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value){
                    setState(() {
                      setState(() => this._showPassword = !this._showPassword);
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 180.0,
                  child:  RaisedButton(
                    onPressed: () async{
                      // MyAuthentication().signUp(Email,Password);
                      // Navigator.pushNamed(context, MyHomePage.id);
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: Email,
                            password:Password,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == Text('weak-password').toString()) {
                          Text('The password provided is too weak.');
                        } else if (e.code == Text('email-already-in-use').toString()) {
                          Text('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    )
    );
  }
}
