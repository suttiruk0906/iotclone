import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iot/screen/my-service.dart';
import 'package:firebase_core/firebase_core.dart';
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {

  double amount = 150.0;
  double size = 250.0;
  String emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool checkSpace(String value) {
    //check Space
    bool result = false;
    if (value.length == 0) {
      //have space
      result = true;  
    }
    return result;
  }

  Widget showLogo() {
    return Container(
      width: amount,
      height: amount,
      child: Image.asset('images/robin-hood.png', fit: BoxFit.cover),
    );
  }

  Widget showname() {
    return Container(
      child: Text(
        'Smart Crab',
        style: TextStyle(
          fontSize: 50.0,
          color: Colors.orange[800],
          fontWeight: FontWeight.bold,
          fontFamily: 'SP-Brushthai2',
        ),
      ),
    );
  }

  Widget emailTextFormfeild() {
    return Container(
      width: size,
      child: TextFormField(
        style: TextStyle(
          color: Colors.orange[600],
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              size: 30.0,
              color: Colors.orange[600],
            ),
            labelText: 'User',
            labelStyle: TextStyle(
              color: Colors.orange[600],
            ),
            hintText: 'abc@email.com'),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Please in E-mail';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true, //secure password
        style: TextStyle(
          color: Colors.orange[600],
        ),
        keyboardType: TextInputType.text, //keyboard style
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 30.0,
            color: Colors.orange[600],
          ),
          labelText: 'Password : ',
          labelStyle: TextStyle(
            color: Colors.orange[600],
          ),
          hintText: 'More 6 Charactor',
        ),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Password Empty';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }
void checkAuthen(BuildContext context) async{
    await firebaseAuth.signInWithEmailAndPassword(
        email: emailString,password: passwordString)
      .then((objValue){
        moveToMyService(context);}).catchError((objValue){
      String error = objValue.message;
      print('error => $error');
    });
 }
  void moveToMyService(BuildContext buildContext){
    var myServiceRoute = MaterialPageRoute(builder: (BuildContext buildContext) => MyService());
    Navigator.of(buildContext)
    .pushAndRemoveUntil(myServiceRoute, (Route<dynamic>route) => false);
  }

  Widget singInButton(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.orange[500],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
           if (formkey.currentState.validate()){
             formkey.currentState.save();
             checkAuthen(context);
           }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment(0, -1),
        padding: EdgeInsets.only(top: 70.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showname(),
              emailTextFormfeild(),
              passwordText(),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                width: size,
                child: Row(
                  children: <Widget>[
                    singInButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
