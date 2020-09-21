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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment(0, -1),
      padding: EdgeInsets.only(top: 70.0),
      child: Column(
        children: <Widget>[Text(''),showLogo(),showname()],
      ),
    ));
  }
}
