
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'info2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


  String m_Diabetes ;
  String m_Pressure ;
  String m_G6PGDeficiency ;
  String m_ChronicSinuistis ;
  String m_Pregnancy ;
 

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
CollectionReference medicineref = FirebaseFirestore.instance.collection("medicines");

var medicinesList=[];

 addMedicines (context) async{
            
if (m_Diabetes==null&&m_Pressure==null&&m_G6PGDeficiency==null&&m_ChronicSinuistis==null&&m_Pregnancy==null){
  AwesomeDialog(context: context,title: "Error" , body: Text("Please Enter the medicines you take"))..show();}
 else{    await medicineref.add({
        "userid": FirebaseAuth.instance.currentUser.uid,
        "medicine" : medicinesList
      }).catchError((e) {
        print("$e");
      });
     
       }

 } 



var chronicDiseaseList = [];

CollectionReference diseasesref = FirebaseFirestore.instance.collection("diseases");


addDiseases (context) async{
  if(chronicDiseaseList.isEmpty){
     AwesomeDialog(context: context,title: "Error" , body: Text("Please choose disease you had"))..show();
      
  } else {await diseasesref.add({
        "userid": FirebaseAuth.instance.currentUser.uid,
        "diseases" : chronicDiseaseList
      }).catchError((e) {
        print("$e");
      });}
}



  
  var Myname, Myphone;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  
CollectionReference userref = FirebaseFirestore.instance.collection("users");
  addUserInfo1(context) async{
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      await userref.add({
        "name": Myname,
        "email": FirebaseAuth.instance.currentUser.email,
        "phone": Myphone,
        "userid": FirebaseAuth.instance.currentUser.uid
      }).catchError((e) {
        print("$e");
      });
      
    }
  
  }


// ignore: must_be_immutable
class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record Your Medical History", style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold),),
        actions: [
          Container(
            width: 40,
            padding: EdgeInsets.only(
                left: 0.0, top: 0.0, right: 10, bottom: 0.0),
            child: Image.asset(
              'assets/images/save3.png',
            ),),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){  Navigator.pop(context,false);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepPurple.shade300,
          ),
        ),
      ),
      body: MyCustomForm(),
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
             m_Diabetes = controller1.text;
             m_Pressure =controller2.text ;
             m_G6PGDeficiency =controller3.text ;
             m_ChronicSinuistis= controller4.text ;
             m_Pregnancy = controller5.text ;
            if(m_Diabetes!=''){medicinesList.add(m_Diabetes);}
            if(m_Pressure!=''){medicinesList.add(m_Pressure);}
            if(m_G6PGDeficiency!=''){medicinesList.add(m_G6PGDeficiency);}
            if(m_ChronicSinuistis!=''){medicinesList.add(m_ChronicSinuistis);}
            if(m_Pregnancy!=''){medicinesList.add(m_Pregnancy);}
            if(medicinesList.isEmpty){AwesomeDialog(context: context,title: "Error" , body: Text("Please write medicine"))..show();}
           else{
               
              await addUserInfo1(context);
              await addMedicines(context);
              await addDiseases(context);
              chronicDiseaseList.clear();
               medicinesList.clear();
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyForm2()));
        }
         
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

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
   bool isDiabetes = false;
  bool isPressure = false;
  bool isG6PGDeficiency = false;
  bool isChronicSinuistis = false;
  bool isPregnancy = false;

  @override
 // ignore: missing_return
  Widget build(BuildContext context) {
    return Stack(
      children: [


        Container(
          constraints: BoxConstraints.expand(),

          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                  image:AssetImage('assets/images/logoOpasity.png'),
                  fit: BoxFit.cover)),),


        ListView(
          padding: EdgeInsets.only(left: 7, top: 0, right: 7, bottom: 0),
          children: [
            Form(
              key: formstate,
              child: Column (children: [
                 ListTile(
              title: Text('Your Name',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              contentPadding: EdgeInsets.only(
                  left: 7, top: 0, right: 1, bottom: 0),
            ),
            Container(
              margin: EdgeInsets.all(0.0),
              height: 40.0,
              child: TextFormField(
                validator: (val){
                  if (val.length > 30) {
                      return "Your name can't to be larger than 30 letter";
                    }
                    if (val.length < 2) {
                      return "Your name can't to be less than 2 letter";
                    }
                    return null;
                },
                 onSaved: (val) {
                    Myname = val;
                  },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.lightBlue),
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Your Phone Number',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              contentPadding: EdgeInsets.all(0.0),
            ),
            Container(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              height: 40.0,
              child: TextFormField(
                
                 onSaved: (val) {
                    Myphone = val;
                  },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '0x000000000',
                  hintStyle: TextStyle(color: Colors.lightBlue),
                   suffixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
        
           
              ],)
             ),
            
        
       SizedBox(
                height: 20,
              ),  
  Row(
    
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
     Container(
            height: 420,width: 140,
              child: Column(
                  children: [
                      Positioned(
                        left: 30,
                        child: 
                        Text('Chronic Diseases You suffer From',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                       
                    SizedBox(
                      height: 10,

                    ),
                    Text('Diabetes'),
                    Checkbox(
                      value: this.isDiabetes,
                      onChanged: (bool value) {
                        setState(() {
                          this.isDiabetes = value;
                          if(isDiabetes==true&&!chronicDiseaseList.contains("Diabetes"))
                          {chronicDiseaseList.add('Diabetes');}
                          else {chronicDiseaseList.remove("Diabetes");
                          controller1.clear();}
                        }
                        );
                      },
                    ),
                    SizedBox(
                      height: 8,

                    ),
                    Text('pressure'),
                    Checkbox(
                      value: this.isPressure,
                      onChanged: (bool value) {
                        setState(() {
                          this.isPressure = value;
                          if(isPressure==true&&!chronicDiseaseList.contains("pressure"))
                          {chronicDiseaseList.add('pressure');
                          }
                          else {chronicDiseaseList.remove("pressure");controller2.clear();}
                        }
                        );
                      },
                    ),
                    SizedBox(
                      height: 8,

                    ),

                    Text('G6PD Deficiency'),
                    Checkbox(
                      value: this.isG6PGDeficiency,
                      onChanged: (bool value) {
                        setState(() {
                          this.isG6PGDeficiency = value;
                          if(isG6PGDeficiency==true&&!chronicDiseaseList.contains("G6PD Deficiency"))
                          {chronicDiseaseList.add('G6PD Deficiency');}
                          else {chronicDiseaseList.remove("G6PD Deficiency");controller3.clear();}

                        }
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,

                    ),
                    Text('Chronic Sinuistis'),
                    Checkbox(
                      value: this.isChronicSinuistis,
                      onChanged: (bool value) {
                        setState(() {
                          this.isChronicSinuistis = value;
                          if(isChronicSinuistis==true&&!chronicDiseaseList.contains("Chronic Sinuistis"))
                          {chronicDiseaseList.add('Chronic Sinuistis');}
                          else {chronicDiseaseList.remove("Chronic Sinuistis");controller4.clear();}
                        }
                        );
                      },
                    ),

                    Text('Pregnancy'),
                    Checkbox(
                      value: this.isPregnancy,
                      onChanged: (bool value) {
                        setState(() {
                          this.isPregnancy = value;
                          if(isPregnancy==true&&!chronicDiseaseList.contains("Pregnancy"))
                          {chronicDiseaseList.add('Pregnancy');}
                          else {chronicDiseaseList.remove("Pregnancy");controller5.clear();}
                        }
                        );
                      },
                    ),

                  ]
              )

          ),
     
     
      Container(
        height:420,width:140,
        child: Column(
          children: [

                      Text('Medicines that you use', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15,),),
                      Container(
                        padding: EdgeInsets.all(0.0),
                        width: 39,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/save2.png'),
                            )),),
                   

                  TextField(
                    
                    enabled: isDiabetes,
                    controller: controller1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    enabled: isPressure,
                    controller: controller2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),

                  TextField(
                    enabled: isG6PGDeficiency,
                    controller: controller3,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,

                  ),
                  TextField(
                    enabled:  isChronicSinuistis,
                    controller: controller4,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 8,

                  ),
                  TextField(
                    enabled: isPregnancy,
                    controller: controller5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                
       
          ],)
      ),
      
    ],
  ),
 


          ],),
      ],


    );
  }
}