import 'package:flutter/material.dart';
import 'package:gp/follow_instructions.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


var locationMessage = "";
  void getCurrentlocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPossition = await Geolocator.getLastKnownPosition();
    print(lastPossition);
    
      locationMessage = "$position";
    
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





showAlarm(context) {

  return showDialog(
      context: context,
      builder: (context) {
                        Future.delayed(Duration(seconds: 2), () async{
                        Navigator.of(context).pop(true);
                       Navigator.of(context).push(MaterialPageRoute(builder:(context)=>follow_instructions()));
                        await sendmail();
                        await sendsms();
                        getCurrentlocation();
                        
                         
                        });
                          
        return AlertDialog(
          title: Text("Save My Soul Application Alarm , Are you fine ??"),
         content: 
          Container(
              height: 50, child: Center(child:FlatButton(onPressed: (){
               
                Navigator.of(context).pop();
                },color:Colors.purpleAccent,
              child: new Text("Stop"),))),
        );
      });
}



