
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Edit3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: edit3() ,
    );
  }
}
class edit3 extends StatefulWidget {
  @override
  _edit3State createState() => _edit3State();
}

class _edit3State extends State<edit3> {
  TextEditingController controller_inst1 = new TextEditingController();
  TextEditingController controller_inst2 = new TextEditingController();
  TextEditingController controller_inst3 = new TextEditingController();
  TextEditingController controller_inst4 = new TextEditingController();
  TextEditingController controller_inst5 = new TextEditingController();
  var inst1;
  var inst2;
  var inst3;
  var inst4;
  var inst5;
  
  editinstructions(context) async{
     var docid;
    CollectionReference instref = FirebaseFirestore.instance.collection("instructions");
    
    await instref.where("userid", isEqualTo:FirebaseAuth.instance.currentUser.uid).get().then((value) {
      value.docs.forEach((element) { 
          docid=element.id;
      });
    }); 
      await instref.doc(docid).update({
        "instruction1": inst1,
        "instruction2": inst2,
        "instruction3": inst3,
        "instruction4": inst4,
        "instruction5": inst5,
        "userid": FirebaseAuth.instance.currentUser.uid,
      }).catchError((e) {
        print("$e");
      });
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
            child: Column(
              children: [
                Container(
                    width: 340,
                    padding: EdgeInsets.only(left: 1.0,top: 0.0,right: 1.0,bottom: 0.0 ),
                    child:Text("Please State Critical Instruction To Be Followed In Case Of Fainting Occurs According To The Main Disease Causing You To Faint ",
                      style: TextStyle(fontSize:23,color:Colors.black54),)
                ),
                Container(
                  margin: EdgeInsets.only(
                    left:30 ,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text("You Should Mention Only One Disease And Its Instructions ",style: TextStyle(fontSize:20,color:Colors.deepPurpleAccent[100],
                    fontWeight:FontWeight.bold,),),
                ),
                Container(
                  padding: EdgeInsets.only( left: 3.0,top: 0.0,right: 3.0,bottom: 0.0 ),
                  child: Text("you can write from 1 to 5 points",style: TextStyle(fontSize:15,color:Colors.black45),),
                ),


                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  width: 340,
                  height:90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: TextField(
                      controller: controller_inst1,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "1)",
                        hintStyle: TextStyle(fontSize:17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  width: 340,
                  height:90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: TextField(
                      controller: controller_inst2,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "2)",
                        hintStyle: TextStyle(fontSize:17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  width: 340,
                  height:90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: TextField(
                      controller: controller_inst3,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "3)",
                        hintStyle: TextStyle(fontSize:17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  width: 340,
                  height:90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: TextField(
                      controller: controller_inst4,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "4)",
                        hintStyle: TextStyle(fontSize:17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  width: 340,
                  height:90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child:Center(
                    child: TextField(
                      controller: controller_inst5,
                      maxLength: 200,
                      decoration: InputDecoration.collapsed(
                        hintText: "5)",
                        hintStyle: TextStyle(fontSize:17),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  alignment:Alignment(.8,0) ,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: ()async{
                      inst1=controller_inst1.text;
                      inst2=controller_inst2.text;
                      inst3=controller_inst3.text;
                      inst4=controller_inst4.text;
                      inst5=controller_inst5.text;
                      
                         await editinstructions(context);
                         
                         Navigator.of(context).pushNamed('Submit');
                        

                     },
                    label: Text("Submit",style: TextStyle(fontSize:25,color:Colors.black54),),
                    icon: Icon(Icons.arrow_forward,color: Colors.deepPurpleAccent[100],size: 25,),
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