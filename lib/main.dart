
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp/beginning.dart';
import 'package:gp/note1.dart';
import 'package:gp/forget_password.dart';
import 'package:gp/login_signup.dart';
import 'package:gp/login.dart';
import 'package:gp/signup.dart';
import 'package:gp/home.dart';
import 'package:gp/fainting_record.dart';
import 'package:gp/ControlAlarm.dart';
import 'package:firebase_core/firebase_core.dart';
bool islogin;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: islogin == false ? beginning() : MyHomePage(),
      routes:
      {
        'Skip' :(context) => Mynote1(),
        'Login' :(context) => login(),
        'Sign UP' :(context) =>signup(),
        'login' :(context) => home(),
        //'Next' :(context) => home(),
        'Forget password ?' :(context) =>forget_password(),
        'Ok':(context) => home(),
        'Control Alarm':(context) =>Alarm(),//Control Alarm not info 3
        // 'follow':(context) =>follow_instructions(),
        //'Edit Medical History':(context) =>info1(),//info 1 not Edit Medical History
        'Fainting Record':(context) =>fainting_record(),
        '/login_signup':(context) =>login_signup(),
        'Submit':(context) => home(),
        'next':(context) => home(),
         "signOut":(context)=>login_signup(),
        'Sign in' :(context) => home(),
        //'/next' :(context) =>info1(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return beginning();


  }
}
