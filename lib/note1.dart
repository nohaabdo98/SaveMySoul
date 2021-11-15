
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import'login_signup.dart';
class Mynote1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyNote1(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>login_signup()));
        },
        icon: Icon(
          Icons.arrow_forward,
          color: Colors.deepPurpleAccent[100],
        ),
        label: Text('Next',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
            )),
        backgroundColor: Colors.white,
      ),

    );
  }
}
class MyNote1 extends StatefulWidget {

  @override
  _MyNote1State createState() => _MyNote1State();
}

class _MyNote1State extends State<MyNote1> {

  @override
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
          left:30,
          width: 300,
          height: 300,
          top:130,
          child:Container(
            padding: EdgeInsets.only(left: 8),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color:Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent[100],
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(50.0),
              ),),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('We Remind You,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,fontStyle:FontStyle.italic),),
                SizedBox(height: 35,),
                Text('check Your location configuration,if it is closed Please open it and if it is open it is OK.',style:TextStyle(fontSize: 23,fontStyle:FontStyle.italic)),
              ],
            ),

          ),
        ),],

    );
  }
}