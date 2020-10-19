
import 'package:attenndance/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';
import 'dashboard.dart';
// import 'package:flutter_icons/flutter_icons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // backgroundColor: Colors.black12,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),


      routes: {
        Register.id:(context)=>Register(),
        DashboardScreen.id:(context)=>DashboardScreen(),

      },
    );

  }
}

class MyHomePage extends StatefulWidget {
  static const String id='main';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

        body:SingleChildScrollView(
      child:
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(left:10.0),
            child:Row(
          children: [

            // SizedBox(width: 5.0,),
            Image.asset('images/logo2.png',width: 200.0,),
            Image.asset('images/blogo.jpg',width: 150.0,),
        ],
      )

          ),
          Card(
            elevation: 20.0,
            color: Colors.indigoAccent,
            margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0,bottom: 10.0),
            child: Column(
              children: [
               Center(
                   child:Text("PLEASE LOGIN HERE",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w800,
                     ),
                   )),
                Container(
                    padding: EdgeInsets.only(top: 5.0),
                    margin: EdgeInsets.only(top:10.0),
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
                        // icon: Icon(Icons.lock,
                        // color: Colors.white,),
                        border: OutlineInputBorder(),

                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock,color: Colors.white,),
                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.white,),
                            onPressed: (){
                              setState(() => this._showPassword = !this._showPassword);
                            }),
                      ),


                    ),
                    // IconButton(icon:Icon(Icons.remove_red_eye) ,
                    //     onPressed:(){
                    //    setState(() {
                    //
                    //    });
                    //     }
                    //     )

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 180.0,
                  child: RaisedButton(
                      onPressed: () async {
                        MyAuthentication().signIn(Email,Password);
                      Navigator.pushNamed(context, DashboardScreen.id);

                      },
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text("Sign In",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,

                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 180.0,
                  child:  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.id);
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
          Container(
            child:Image.asset('images/logo.jpg'),
          ),
          ]
      ),
        ),
        )
    );
  }
}
