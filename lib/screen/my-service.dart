import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  @override
Widget button(){
    return RaisedButton(
      color: Colors.blue[500],
      textColor: Colors.white,
      child: Text('Send'),
      onPressed:(){},
    );
  }

  Widget build(BuildContext context){
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
            children: [button()],
          ),
        ),
      ),
    );
  }
}