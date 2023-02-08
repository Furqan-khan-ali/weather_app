
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadScreen extends StatefulWidget{
  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomCenter,
          colors: [Colors.purple,Colors.blue])
        ),
        child: Center(
          child: SpinKitRipple(
            color: Colors.white70,
            size: 150,
            duration: Duration(milliseconds: 1200),
          ),
          ),
        ),
      );
  }
}