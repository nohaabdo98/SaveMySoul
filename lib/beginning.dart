//import 'package:beginning/login_signup.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override

/*void goTologinsignup(BuildContext ctx) {
Navigator.of(ctx).push(MaterialPageRoute(
  builder: (_)
  {
    return login_signup();
  }
));
}*/

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: beginning(),
    );
  }
}
class beginning extends StatefulWidget {
  @override
  _beginningState createState() => _beginningState();
}

class _beginningState extends State<beginning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff849DFE),
      body: Center(
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 90),
            child: Column(
              children:[
                SizedBox(),
                SizedBox(),

                // Padding(padding:)
                Image.asset('assets/images/cover.png',fit: BoxFit.cover,height: 450,width: double.infinity,),
                SizedBox(
                  /* child: FloatingActionButton(
            onPressed: () {  },
           backgroundColor: Colors.white,
            child: Text("Skip >>",
            style: TextStyle(
              color: Color(0x99707070)
            ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)
              ),
      ),
             ),*/
                ),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).pushNamed('Skip');
        },
        label:Text("Skip",style: TextStyle(fontSize:20)),
        icon: Icon(Icons.arrow_right,color: Color(0xff849DFE),size: 35,),
        foregroundColor: Color(0xff707070),
        backgroundColor: Colors.white,

      ),

    );


  }





}