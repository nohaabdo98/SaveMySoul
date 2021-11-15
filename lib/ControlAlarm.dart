

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/alter.dart';
import 'home.dart';

 

 

class Alarm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Stack(
        children:[
          Scaffold(
            extendBodyBehindAppBar: false,

            appBar: AppBar(
              backgroundColor: Colors.white,

              leading: IconButton(
                onPressed: () => Navigator.pop(context, false),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.deepPurple.shade300,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: (){  Navigator.of(context).pushNamed('/login_signup');},
                  icon: Icon(
                    Icons.home,
                    color: Colors.deepPurple.shade300,
                  ),
                ),
              ],
            ),
            body: MyPage(),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                
               Navigator.of(context).push(MaterialPageRoute(builder:(context)=>home()));},
               
              label: Text('OK',
                  style: TextStyle(
                    fontSize: 24,
                    color:Colors.black54,
                  )),
              backgroundColor: Colors.white,
            ),
            
          ),],),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

 bool _pinned = false;

 void _startTimer() {
    
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setState(() {
        if(_pinned==true){
          showAlarm(context);
        }else if(_pinned==false){ timer.cancel();}
        
      });
    });
  }
 
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          margin: EdgeInsets.all(0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                  image:AssetImage('assets/images/logoOpasity.png'),
                  fit: BoxFit.cover)),),

        Positioned(
          width: 300,
          left: 35,
          height: 560,
          top:30,
          child: Container(
            width: 260,
            padding: EdgeInsets.only(left: 9.0,top: 0.0,right:0,bottom: 0.0),
            decoration: BoxDecoration(
                color:Colors.white),

            child:Container(

              child:Column(
                children: [
                  Image.asset(
                    'assets/images/alarm.png',
                  ),
                  Text('If you feel tired please Activate the Alarm',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                  Positioned(
                    top: 160,
                    child:Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _pinned = val;
                          print(_pinned);
                         
                        });
                        if(_pinned==true){
                           _startTimer();
                        }
                      },
                      value: _pinned,
                    ),),
                    
                ],),),),),
        Positioned(
          top: 410,
          left: 44,

          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Time Limit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(
                width: 40,
              ),
              Icon(Icons.alarm),
              Text('10 sec'),
               
            ],
          ),),

      ],);



  }
}
  


   