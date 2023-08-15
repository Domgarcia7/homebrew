import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/finished.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class InputCupsScreen extends StatefulWidget {
  String device;
  InputCupsScreen(this.device);

  @override
  InputCupsScreenState createState() => InputCupsScreenState();
}

class InputCupsScreenState extends State<InputCupsScreen> {
  bool continueAllowed = false;
  int numCups;
  double gramsCoffGnd;
  double gramsWater;
  double ozsWater;
  String coffeeGnd = '';

  final inputCupsText = new TextEditingController();

  void checkInput(String s) {
    if (s == null) {
      continueAllowed = false;
    }
    if (s == '') {
      continueAllowed = false;
    }
    if (s.contains(new RegExp(r'^[1-9][0-9]*$'))) {
      continueAllowed = true;
      print(continueAllowed);
    } else {
      continueAllowed = false;
      print(continueAllowed);
    }
    if (widget.device == "French Press") {
      coffeeGnd = 'Course Ground Coffee';
    } else {
      coffeeGnd = 'Medium Ground Coffee';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF4C748B),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
          },
          key: Key('back-btn-2'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How many cups would you like?",
              key: Key('textEntry2'),
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF4C748B),
                  fontSize: 18),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              height: 48.0,
              width: 337.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Color(0xFF4C748B), width: 1.75),
                ),
                child: TextField(
                  key: Key('input-cup-field'),
                  textAlign: TextAlign.center,
                  onChanged: checkInput,
                  controller: inputCupsText,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              height: 48.0,
              width: 337.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      continueAllowed ? Color(0xFF4C748B) : Color(0xFFE2E2E2),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: TextButton(
                  key: Key('contInput-btn'),
                  onPressed: continueAllowed
                      ? () {
                          numCups = int.parse(inputCupsText.text);
                          ozsWater =
                              CoffeeTools.cupsToOunces(numCups).toDouble();
                          gramsWater = CoffeeTools.ozToGrams(ozsWater);
                          if (widget.device == "French Press") {
                            gramsCoffGnd =
                                CoffeeTools.ratioCoffeeFP(gramsWater);
                          } else {
                            gramsCoffGnd =
                                CoffeeTools.ratioCoffeeDM(gramsWater);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => resultScreen(
                                      gramsCoffGnd,
                                      gramsWater,
                                      coffeeGnd,
                                      widget.device)));
                        }
                      : null,
                  child: Text(
                    "Continue",
                    key: Key('contInput-text'),
                    style: continueAllowed
                        ? TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: 2)
                        : TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color(0xFF757474),
                            letterSpacing: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}