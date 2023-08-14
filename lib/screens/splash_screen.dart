import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color (0xFF4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("HOMEBREW",
            style: TextStyle(
              color: Colors. white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: "Norwester")),
            
           Text("Great Coffee at Home",
           style: TextStyle(
            color: Colors.white, 
            fontSize: 18,
            fontWeight: FontWeight. normal,
            fontFamily: "kollektif"
           )
           )],

        ),
      ),
    );
  }
}
