import 'package:gp/follow_instructions.dart';
import 'package:gp/edit1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';



 var insta1,insta2,insta3,insta4,insta5;

  var ex_Username1,ex_Username2,ex_Username3,ex_Email1,ex_Email2,ex_Email3,ex_Phone1,ex_Phone2,ex_Phone3;


 getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user.email);
  }
  

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home() ,
    );
  }
}
class home extends StatefulWidget {
 
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
 

  @override
  void initState() {
    getUser();
    super.initState();
  }


var locationMessage = "";
  void getCurrentlocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPossition = await Geolocator.getLastKnownPosition();
    print(lastPossition);
    setState(() {
      locationMessage = "$position";
    });
  }

  sendmail() async {
    String username = 'gppro2919@gmail.com';
    String password = 'gp2021@fci';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Save My Soul')
      ..recipients.add('$ex_Email1')
      ..ccRecipients.addAll(['$ex_Email1'])
      ..subject = 'Emergency!! :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>The Current Location Of The Patient is :-</h1>\n<p>$locationMessage";

final message2 = Message()
      ..from = Address(username, 'Save My Soul')
      ..recipients.add('$ex_Email2')
      ..ccRecipients.addAll(['$ex_Email2'])
      ..subject = 'Emergency!! :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>The Current Location Of The Patient is :-</h1>\n<p>$locationMessage";

final message3 = Message()
      ..from = Address(username, 'Save My Soul')
      ..recipients.add('$ex_Email3')
      ..ccRecipients.addAll(['$ex_Email3'])
      ..subject = 'Emergency!! :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>The Current Location Of The Patient is :-</h1>\n<p>$locationMessage";

    try {
      final sendReport = await send(message, smtpServer);
      final sendReport2 = await send(message2, smtpServer);
      final sendReport3 = await send(message3, smtpServer);
      print('Message sent: ' + sendReport.toString() + sendReport2.toString() + sendReport3.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  sendsms() async {
    String lsms = "sms:$ex_Phone1";
    String lsms2 = "sms:$ex_Phone2";
    String lsms3 = "sms:$ex_Phone1";
    launch(lsms);
    launch(lsms2);
    launch(lsms3);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('User: ${FirebaseAuth.instance.currentUser.email}', style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold),),

        backgroundColor: Colors.white,
        //title: Text("Fainting record state"),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 15.0),
            child:GestureDetector(
              onTap:() async { 
                 
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("signOut");},
              child:Icon(Icons.exit_to_app ,color: Colors.deepPurpleAccent[100]),
            ),
          ),
        ],
      ),



      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/images/logoOpasity.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:Center(
          child:Column(
            children: [


              SizedBox(height:30),
              //Edit Medical History
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  padding: EdgeInsets.only(left: 3.0,top: 0.0,right: 3.0,bottom: 0.0),
                  height: 205,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),

                  child: Column(
                    children: [
                      SizedBox(height:3),
                      Image.asset('assets/images/edit image.jpg',
                        height: 130,
                        width: 130,
                      ),
                      SizedBox(height:1),
                      Container(
                        padding: EdgeInsets.only(left: 30.0,top: 0.0,right: 0.0,bottom: 0.0),
                        child:InkWell(
                            child: Text("Edit Medical History",style: TextStyle(fontSize:18, color:Colors.black54,fontWeight:FontWeight.w800),),
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Edit1()));}
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3.0,top: 0.0,right: 3.0,bottom: 0.0),
                  height: 205,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),

                  child: Column(
                    children: [
                      SizedBox(height:3),
                      Image.asset('assets/images/emergency.jpg',
                        height: 130,
                        width: 130,
                      ),
                      SizedBox(height:1),
                      Container(
                        padding: EdgeInsets.only(left: 30.0,top: 0.0,right: 0.0,bottom: 0.0),
                        child:InkWell(
                            child: Text("Emergency Contact",style: TextStyle(fontSize:18, color:Colors.black54,fontWeight:FontWeight.w800),),
                            onTap:()async{
                              getCurrentlocation();
                              await sendmail();
                              await sendsms();
                              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>follow_instructions()));
                               }
                        ),
                      ),
                    ],
                  ),
                ),

              ],),


              SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //Fainting Record
                  Container(
                    padding: EdgeInsets.only(left: 3.0,top: 0.0,right: 3.0,bottom: 0.0),
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),

                    child: Column(
                      children: [
                        SizedBox(height:3),
                        Image.asset('assets/images/Fainting Record.png',
                          height: 130,
                          width: 130,
                        ),
                        SizedBox(height:5),
                        Container(
                          padding: EdgeInsets.only(left: 30.0,top: 0.0,right: 0.0,bottom: 0.0),
                          child:InkWell(
                            child: Text("Fainting Record",style: TextStyle(fontSize:18, color:Colors.black54,fontWeight:FontWeight.w800),),
                            onTap:(){
                               Navigator.of(context).pushNamed('Fainting Record');
                             },
                          ),
                        ),
                      ],
                    ),
                  ),


//Control Alarm
                  Container(
                    padding: EdgeInsets.only(left: 3.0,top: 0.0,right: 3.0,bottom: 0.0),
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),

                    child: Column(
                      children: [
                        SizedBox(height:3),
                        Image.asset('assets/images/control alarm.png',
                          height: 130,
                          width: 130,
                        ),
                        SizedBox(height:5),
                        Container(
                          padding: EdgeInsets.only(left: 30.0,top: 0.0,right: 0.0,bottom: 0.0),
                          child:InkWell(
                            child: Text("Control Alarm",style: TextStyle(fontSize:18, color:Colors.black54,fontWeight:FontWeight.w800),),
                            onTap:(){
                              Navigator.of(context).pushNamed('Control Alarm');},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
