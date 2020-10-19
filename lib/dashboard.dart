import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DashboardScreen extends StatelessWidget {
  static const String id='dashboard';
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    _auth.currentUser;
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
        appBar: AppBar(title: Text("Dashboard"),),
        body: Center(child: Text("Hello: User "),),
      ),
    );
  }
}
