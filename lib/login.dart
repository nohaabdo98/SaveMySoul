import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyApp extends StatelessWidget {
  /*void forgetPass (BuildContext context){
  Navigator.of(context).pushNamed('Forget password ?');
}*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login() ,
    );
  }
}
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool passWordVisiable= true;
   var mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email"))
            ..show();
          
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user"))
            ..show();
        }
      }
    } else {
      print("Not Vaild");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyleading:true,
        leading:IconButton(icon: Icon(Icons.arrow_back),color: Colors.deepPurpleAccent[100],onPressed: ()=>Navigator.pop(context,false),
        ),
      ),


      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/logoOpasity.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formstate,
              child: Column(
              children: [

                SizedBox(height: 90,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (val.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: TextStyle(fontSize:25),
                        prefixIcon: Icon(Icons.person_outline ,size: 30,color: Colors.deepPurpleAccent[100],)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                     onSaved: (val) {
                        mypassword = val;
                      },
                      validator: (val) {
                        if (val.length > 100) {
                          return "Password can't to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "Password can't to be less than 4 letter";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize:25),
                      prefixIcon: IconButton(icon: Icon (
                          passWordVisiable? Icons.visibility:Icons.visibility_off
                      ),
                          color: Colors.deepPurpleAccent[100],
                          onPressed:(){
                            setState(() {
                              passWordVisiable=!passWordVisiable;
                            });
                          }
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passWordVisiable,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerRight,
                  child:InkWell(
                    child: Text("Forget password ?",style: TextStyle(fontSize:15, color: Color(0x99908f8f)),),
                    onTap:(){
                      Navigator.of(context).pushNamed('Forget password ?');
                    },
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  alignment:Alignment(.8,0) ,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () async{
                      var user = await signIn();
                        if (user != null) {
                      Navigator.of(context).pushNamed('login');}
                      },
                    label: Text("login",style: TextStyle(fontSize:25,color:Colors.black54),),
                    backgroundColor: Color(0xffBBC7FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ],

            ),
            ),
            
            
          ),
        ),

      ),

    );

  }
}