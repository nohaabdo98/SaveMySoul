import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: forget_password() ,
    );
  }
}
class forget_password extends StatefulWidget {
  @override
  _forget_passwordState createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  bool passWordVisiable = true;
  TextEditingController controller_password = new TextEditingController();
  TextEditingController controller_confirmpassword = new TextEditingController();
  TextEditingController controller_Email = new TextEditingController();
  var password,comfirm_password,email;
  
  void changePassword(String password) async{
   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;  
   User user = firebaseAuth.currentUser; 
    user.updatePassword(password).then((_){
  print("Successfully changed password");
    }).catchError((error){
  print("Password can't be changed" + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.deepPurpleAccent[100],
          onPressed: () => Navigator.pop(context, false),
        ),
      ),


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logoOpasity.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text("Create your own new password", style: TextStyle(
                      fontSize: 40,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),),

                ),

                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextField(
                    enabled: true,
                    controller: controller_Email,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 25),
                        prefixIcon: Icon(Icons.person_outline, size: 30,
                          color: Colors.deepPurpleAccent[100],)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller_password,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize: 25),
                      prefixIcon: IconButton(icon: Icon(
                          passWordVisiable ? Icons.visibility : Icons
                              .visibility_off
                      ),
                          color: Colors.deepPurpleAccent[100],
                          onPressed: () {
                            setState(() {
                              passWordVisiable = !passWordVisiable;
                            });
                          }
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passWordVisiable,
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller_confirmpassword,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 25),
                      prefixIcon: IconButton(icon: Icon(
                          passWordVisiable ? Icons.visibility : Icons
                              .visibility_off
                      ),
                          color: Colors.deepPurpleAccent[100],
                          onPressed: () {
                            setState(() {
                              passWordVisiable = !passWordVisiable;
                            });
                          }
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passWordVisiable,
                  ),
                ),


                SizedBox(height: 30,),
                Container(
                  alignment: Alignment(.8, 0),
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () async{
                      email=controller_Email.text;
                      password=controller_password.text;
                      comfirm_password=controller_confirmpassword.text;
                      
                        await changePassword(password);
                       Navigator.of(context).pushNamed('Ok');
                     
                    },
                    label: Text("Ok",
                      style: TextStyle(fontSize: 25, color: Colors.black54),),
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

    );
  }
}