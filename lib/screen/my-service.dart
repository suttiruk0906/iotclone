//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}


class _MyServiceState extends State<MyService> {

  FirebaseDatabase firebaseDatabase=FirebaseDatabase.instance;
  Map<dynamic,dynamic> iotmap;
  int fanInt;
  String fanString = 'Stop Fan';
  String temp_inside ='https://pub.dev/packages/flutter_native_web/install';
  WebController webController;
  String nameLogin= "",uidString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  void onWebCreatTempInside(webController){
    this.webController = webController;
    this.webController.loadUrl(temp_inside);
    this.webController.onPageStarted.listen((url) => print("Loding $url") );
    this.webController.onPageFinished.listen((url) =>print("Finished loding $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("finish Loding....$url"));
  }

  @override
  void initState(){
    super.initState();
    getValueFromFibase();
  }

  void getValueFromFibase()async{
    DatabaseReference databaseReference =
    await firebaseDatabase.reference().once().then((objValue){
      iotmap = objValue.value;
      setState(() {
        fanInt = iotmap['root'];
        print('fan= $fanInt');
      });
    });
  }
  void editFribase(String nodeString, int value) async{
    print('node ==> $nodeString');
    iotmap['$nodeString']=value;
    await firebaseDatabase.reference().set(iotmap).then((objvalue){
      print('$nodeString Success');
      getValueFromFibase();
    }).catchError((objValue){
      String error = objValue.message;
      print('error ==> $error');
    });
  }
Widget button(){
    return Container(
      margin: EdgeInsets.only(top:500),
      alignment: Alignment.center,
      width :150,
      child: Expanded(child: FlatButton(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ), color: Colors.blue[500],
      textColor: Colors.white,
      child: Text(fanString,style: TextStyle(color: Colors.white),
      ),
      
      onPressed:(){
        if (fanInt == 1) {
          fanString='Stop Fan';
          editFribase('root', 0);
        } else {
          fanString='Open Fan';
          editFribase('root', 1);
        }
      },
      ),
      ),
    );
  }


  Widget build(BuildContext context){
    FlutterNativeWeb flutterNativeWebTempInside = new FlutterNativeWeb(onWebCreated: onWebCreatTempInside,gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[Factory<OneSequenceGestureRecognizer>(()=> TapGestureRecognizer(),),].toSet(),);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0,-1),
              colors: [
                Colors.white,
                Colors.blue[300],
              ],
              radius:1.5),
          ),

          child: ListView(
            children:<Widget> [
              Column(
                children: <Widget>[
                  button(),
                  Container(
                    child: flutterNativeWebTempInside,
                    height:300.0,
                    width:500.0)
                  ],
               )
            ],
          ),
        ),
      ),
    );
  }
}