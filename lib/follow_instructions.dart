
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


  var insta1='',insta2='',insta3='',insta4='',insta5='';



  var ex_Username1,ex_Username2,ex_Username3,ex_Email1,ex_Email2,ex_Email3,ex_Phone1,ex_Phone2,ex_Phone3;

 
 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: follow_instructions() ,
      
    );
    
  }
  
}
class follow_instructions extends StatefulWidget {


  @override
  _follow_instructionsState createState() => _follow_instructionsState();
}

class _follow_instructionsState extends State<follow_instructions> {

_getData()async{
    
    CollectionReference instref = FirebaseFirestore.instance.collection("instructions");
   
    await instref.where("userid", isEqualTo:FirebaseAuth.instance.currentUser.uid).get().then((value) {
      value.docs.forEach((element) { 
        insta1=element['instruction1'];
        insta2=element['instruction2'];
        insta3=element['instruction3'];
        insta4=element['instruction4'];
        insta5=element['instruction5'];
         print (insta1);
         print (insta2);
         print (insta3);
         print (insta4);
         print (insta5);
         
         }

      );
    });
    
  }
  ////////////////////
  
  _sendLocation()async{
    CollectionReference externaluserref = FirebaseFirestore.instance.collection("external_users");
    await externaluserref.where("userid", isEqualTo:FirebaseAuth.instance.currentUser.uid).get().then((value) {
      value.docs.forEach((element) { 
          ex_Email1=element['Ex_user1 Email'];
          ex_Email2=element['Ex_user2 Email'];
          ex_Email3=element['Ex_user3 Email'];
          ex_Phone1=element['Ex_user1 Phone'];
          ex_Phone2=element['Ex_user2 Phone'];
          ex_Phone3=element['Ex_user3 Phone'];
         print("===================================");
          print(ex_Email1);
          print(ex_Email2);
          print(ex_Email3);
          print("===================================");
      });
    });
 }

////////////////////////////
///
///

 ////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
       body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/logoOpasity.png'),
            fit: BoxFit.cover,
          ),
        ),


        child: SingleChildScrollView(
          child:Column(

            children: [
              SizedBox(height: 10,),

              
                Container(
                width: 550,
              
                margin  : const EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(30.0),
                child: FlatButton(onPressed: ()async{
                 await _getData();
                 

              },
                color:Color(0xff849DFE) ,
              child: new Text("Please follow these instructions to save life of this patient ",style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),),
                
                ),
                SizedBox(width: 50,),
               Container(
                 
                width: 350,
                
                margin  : const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(15.0),
                child: Text('Instruction1: $insta1',style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
               SizedBox(width: 5,),
               Container(
                 
                width: 350,
               
                margin  : const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(15.0),
                child: Text('Instruction2: $insta2',style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(width: 5,),
               Container(
                 
                width: 350,
          
                margin  : const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(15.0),
                child: Text('Instruction3: $insta3',style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(width: 5,),
             Container(
                 
                width: 350,
       
                margin  : const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(15.0),
                child: Text('Instruction4: $insta4',style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              SizedBox(width: 5,),
               Container(
                 
                width: 350,
  
                margin  : const EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(15.0),
                child: Text('Instruction5: $insta5',style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,color:Colors.black54,),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}