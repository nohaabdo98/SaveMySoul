import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gp/info3.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


GlobalKey<FormState> formstate = new GlobalKey<FormState>();
var ex_Username1,ex_Username2,ex_Username3,ex_Email1,ex_Email2,ex_Email3,ex_Phone1,ex_Phone2,ex_Phone3;

CollectionReference externaluserref = FirebaseFirestore.instance.collection("external_users");
addExternalUsers(context) async {
    
    var formdata = formstate.currentState;
    if (!formdata.validate()) {
       AwesomeDialog(context: context,title: "Error" , body: Text("Please Enter Data"))..show();
    }
    else{  formdata.save();
      await externaluserref.add({
      "userid": FirebaseAuth.instance.currentUser.uid,
      "Ex_user1 Name": ex_Username1,
      "Ex_user1 Phone": ex_Phone1,
      "Ex_user1 Email": ex_Email1,
      "Ex_user2 Name": ex_Username2,
      "Ex_user2 Phone": ex_Phone2,
      "Ex_user2 Email": ex_Email2,
      "Ex_user3 Name": ex_Username3,
      "Ex_user3 Phone": ex_Phone3,
      "Ex_user3 Email": ex_Email3,
      
      }).catchError((e) {
        print("$e");
      });
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>info3()));
    }
  }

class MyForm2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon:Icon(
            Icons.arrow_back,
            color: Colors.deepPurpleAccent[100],),
            onPressed:()=> Navigator.pop(context),
          ),
        ),

        body: MyCustomForm(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
           
            await addExternalUsers(context);
            
          },
          label: const Text('Next',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
              )),
          icon:  Icon(
            Icons.arrow_forward,
            color: Colors.deepPurpleAccent[100],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  bool value = false;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                  image:AssetImage('assets/images/logoOpasity.png'),
                  fit: BoxFit.cover)),),

        Positioned(
          // padding: EdgeInsets.only(left: 4,top: 4),
          child:Form(
            key: formstate,
            child:ListView( children:[
             Column(children:[
              Container(

                child: Text('Please Add Phone Number And E-mail of the person who will help if you faint',style:TextStyle(fontWeight: FontWeight.bold,fontSize:22,color: Colors.black54),),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Username1 = val;
                      },
                      validator: (val) {
                        if (val.length > 50) {
                          return "Name can't to be larger than 50 letter";
                        }
                        if (val.length < 2) {
                          return "Name can't to be less than 2 letter";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'Name',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Phone1 = val;
                      },
                      validator: (val) {
                        if (val.length > 24) {
                          return "Phone number can't to be larger than 24 numbers";
                        }
                        if (val.length < 8) {
                          return "Phone number can't to be less than 8 numbers";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'0x000000000',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Email1 = val;
                      },
                      validator: (val) {
                        if (val.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 10) {
                          return "Email can't to be less than 10 letter";
                        }
                        return null;
                      },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'xxx@xxx.xxx',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                ),

              ),
              SizedBox(
                height: 37,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Username2 = val;
                      },
                      validator: (val) {
                        if (val.length > 50) {
                          return "Name can't to be larger than 50 letter";
                        }
                        if (val.length < 2) {
                          return "Name can't to be less than 2 letter";
                        }
                        return null;
                      },
                  keyboardType: TextInputType.text,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'Name',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Phone2 = val;
                      },
                      validator: (val) {
                        if (val.length > 24) {
                          return "Phone number can't to be larger than 24 letter";
                        }
                        if (val.length < 8) {
                          return "Phone number can't to be less than 8 letter";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'0x00000000',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Email2 = val;
                      },
                      validator: (val) {
                        if (val.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 10) {
                          return "Email can't to be less than 10 letter";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'xxx@xxx.xxx',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                ),

              ),
              SizedBox(
                height:36,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Username3 = val;
                      },
                      validator: (val) {
                        if (val.length > 50) {
                          return "Email can't to be larger than 50 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                  keyboardType: TextInputType.text,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'Name',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Phone3 = val;
                      },
                      validator: (val) {
                        if (val.length > 24) {
                          return "Phone Number can't to be larger than 100 letter";
                        }
                        if (val.length < 8) {
                          return "Phone Number can't to be less than 2 letter";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'0x00000000',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                ),

              ),
              SizedBox(
                height:10,
              ),
              Container(
                padding: EdgeInsets.only(left:0.0,right:10.0,top:0.0,bottom: 0.0),
                height: 40.0,
                child: TextFormField(
                  onSaved: (val) {
                        ex_Email3 = val;
                      },
                      validator: (val) {
                        if (val.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 10) {
                          return "Email can't to be less than 10 letter";
                        }
                        return null;
                      },
                  cursorColor: Theme.of(context).cursorColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:'xxx@xxx.xxx',
                    hintStyle: TextStyle(color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white70,
                    border:OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                ),

              ),
            ],),
            ],),
           
            
          ),
        ),
      ],
    );
  }
}

