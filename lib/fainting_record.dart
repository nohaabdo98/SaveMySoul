
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: fainting_record() ,
    );
  }
}
class fainting_record extends StatefulWidget {


  @override
  _fainting_recordState createState() => _fainting_recordState();
}

class _fainting_recordState extends State<fainting_record> {

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
 
  var r1;
  var r2;
  var r3;
  var r4;
   CollectionReference instref = FirebaseFirestore.instance.collection("fainting_state");
  addFaintingState(context) async{
    
      await instref.add({
        "reason1": r1,
        "reason2": r2,
        "reason3": r3,
        "reason4": r4,
        "userid": FirebaseAuth.instance.currentUser.uid
      }).catchError((e) {
        print("$e");
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, false);
          },
          child: Icon(Icons.arrow_back, color: Colors.deepPurpleAccent[100]),),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/login_signup');
              },
              child: Icon(Icons.home, color: Colors.deepPurpleAccent[100]),
            ),
          ),
        ],
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

                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  alignment: Alignment.center,
                  child: Text("Please record real reason of fainting state ",
                    style: TextStyle(fontSize: 22, color: Colors.deepPurpleAccent[100],
                      fontWeight: FontWeight.bold,),),
                ),


                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: controller1,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "1)",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: controller2,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "2)",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: controller3,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "3)",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: controller4,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "4)",
                        hintStyle: TextStyle(fontSize: 17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),


                SizedBox(height: 10,),
                Container(
                  alignment: Alignment(.8, 0),
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: () async{
                      r1=controller1.text;
                      r2=controller2.text;
                      r3=controller3.text;
                      r4=controller4.text;
                      if(r1!=''||r2!=''||r3!=''||r4!=''){
                        await addFaintingState(context);
                      Navigator.of(context).pushNamed('Submit');}
                      else{
                        AwesomeDialog(context: context,title: "Error" , body: Text("Please enter the data"))..show();
                      }
                    },
                    label: Text("Submit",
                      style: TextStyle(fontSize: 20, color: Colors.black54),),
                    icon: Icon(
                      Icons.arrow_forward, color: Colors.deepPurpleAccent[100], size: 25,),
                    backgroundColor: Colors.white,
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