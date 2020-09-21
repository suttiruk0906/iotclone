import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //E
  double amount = 150.0;
  double size = 250.0;
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment(0, -1),
      padding: EdgeInsets.only(top: 70.0),
      child: Column(
        children: <Widget>[showLogo(), showname(),emailTextFormfeild(),passwordText()],
      ),
    ));
  }
}
