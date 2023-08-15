import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/cups_screen.dart';

class resultScreen extends StatefulWidget {
  double gCoffee;
  double gWater;
  String cGround;
  String device;
  resultScreen(this.gCoffee, this.gWater, this.cGround, this.device);
  @override
  resultScreenState createState() => resultScreenState();
}

class resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF4C748B),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputCupsScreen(widget.device)));
          },
          key: Key('back-btn'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 164.0,
              width: 337.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Color(0xFF4C748B), width: 1.75),
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(6)),
                    Text(
                      "Recommended",
                      style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 18,
                          letterSpacing: 1.5,
                          color: Color(0xFF4C748B)),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFF4C748B),
                      thickness: 0.75,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text('${widget.gCoffee.toInt()}g - ${widget.cGround}',
                        key: Key('coffeeGramstext'),
                        style: TextStyle(
                            fontFamily: 'Kollektif',
                            fontSize: 14,
                            color: Color(0xFF4C748B))),
                    Text('${widget.gWater.toInt()}g - Water',
                        key: Key('waterGramstext'),
                        style: TextStyle(
                            fontFamily: 'Kollektif',
                            fontSize: 14,
                            color: Color(0xFF4C748B))),
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      'Enjoy your delicious coffee.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF4C748B)),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(50)),
            Container(
              height: 46.0,
              width: 280.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4C748B),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseDeviceScreen()));
                  },
                  key: Key('done-btn'),
                  child: Text("Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        letterSpacing: 1,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}