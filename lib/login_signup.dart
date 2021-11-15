import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login_signup() ,
    );
  }
}
class login_signup extends StatefulWidget {
  @override
  _login_signupState createState() => _login_signupState();
}

class _login_signupState extends State<login_signup> {
  @override
  Widget build(BuildContext context) {
    var white = Colors.white;
    return Scaffold(
      backgroundColor: Color(0xff849DFE),
      body:Center(
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),

          child:Column(
            children:[
              CircleAvatar(
                backgroundImage:AssetImage("assets/images/logo.png"),
                radius: 165,
              ),
              SizedBox(height: 40,),
              RaisedButton(
                onPressed:(){ Navigator.of(context).pushNamed('Login');},
                color: Color(0xfffdfdfd),
                child: Text("Login",style: TextStyle(fontSize:25),),
                textColor: Color(0xff737373),
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),

                ),
              ),
              SizedBox(height: 15,),
              RaisedButton(
                onPressed:(){Navigator.of(context).pushNamed('Sign UP');},
                color:Color(0xfffdfdfd),
                child: Text("Sign UP",style: TextStyle(fontSize:25),),
                textColor: Color(0xff737373),
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),

            ],

          ),

        ),
      ),
    );
  }
}
