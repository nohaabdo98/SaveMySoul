import 'package:gp/info1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup() ,
    );
  }
}
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool passWordVisiable= true;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var username, password, confirmPassword;

  signUp() async{
      var formdata = formstate.currentState ;
      if (formdata.validate()) {
      formdata.save();
      try {
       // showLoading(context);
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password
        
        );
        return userCredential;
        } on FirebaseAuthException catch (e) {
          
     if (e.code == 'weak-password') {
        AwesomeDialog(context: context,title: "Error" , 
        body: Text("The password provided is too weak. please write strong password to save your account."))..show();
       
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(context: context,title: "Error" , 
        body: Text("The account already exists for that email. please write correct email."))..show();
       
      } 
    } catch (e) {
      print(e);
    }

      }
        }
        

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
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
            child:Column(
              children: [

                SizedBox(height: 80,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Form(
                      key: formstate,
                      child: Column(
                        children: [
                  TextFormField(
                    onSaved: (val){
                      username = val;
                    },
                    validator: (val){
                      if(val.length>100){
                        return "E-mail can't be larger than 100";
                      }
                      if(val.length<2){
                        return "E-mail can't be less than 2";
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
                  SizedBox(height: 25,),
                TextFormField(
                    onSaved: (val){
                      password = val;
                    },
                    validator: (val){
                      if(val.length>20){
                        return "password can't be larger than 20";
                      }
                      if(val.length<6){
                        return "password can't be less than 6";
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

                SizedBox(height: 25,),
                TextFormField(
                    onSaved: (val){
                      confirmPassword = val;
                    },
                    validator: (val){
                      
                      if(val.length>20){
                        return "password can't be larger than 20";
                      }
                      if(val.length<6){
                        return "password can't be less than 6";
                      }
                      if(confirmPassword != password){
                            //return 'Not Match';
                            print("not match");
                            return "Not match re-enter the password";
                            }else{
                              print("matched");
                            }
                      
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize:25),
                      prefixIcon: IconButton(icon: Icon (
                          passWordVisiable? Icons.visibility:Icons.visibility_off
                      ),
                          color:Colors.deepPurpleAccent[100],
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


                SizedBox(height: 50,),
                FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () async{
                      UserCredential response= await signUp();
                      if (response!=null){
                     Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyForm()));
                      }else{
                        return "Signup faild";
                      }
                    },
                    label: Text("Next",style: TextStyle(fontSize:25,color:Colors.black54),),
                    backgroundColor: Color(0xffBBC7FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
               
                        ],
                      ),
                  ),
                ), 
              ],

            ),

          ),
        ),

      ),

    );

  }
}