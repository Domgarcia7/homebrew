import 'package:flutter/material.dart';
import 'package:homebrew/screens/cups_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  ChooseDeviceScreen();
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool frenchPressed = false;
  bool dripPressed = false;
  bool continueAllowed = false;
  String deviceName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What coffee maker are you using?",
                  key: Key('textEntry'),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xFF4C748B))),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                height: 96.0,
                width: 337.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(width: 2.0, color: Color(0xFF4C748B))),
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      children: [
                        TextButton(
                          key: Key('fp-btn'),
                          style: ButtonStyle(alignment: Alignment.topLeft),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "French Press",
                                key: Key('fp-btn-text'),
                                style: TextStyle(
                                    color: Color(0xFF4C748B),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 1),
                              ),
                              Spacer(
                                flex: 5,
                              ),
                              Icon(
                                Icons.check,
                                key: Key("Check1"),
                                color: frenchPressed
                                    ? Color(0xFF4C748B)
                                    : Color(0xFFFFFFFF),
                              )
                            ],
                          ),
                          onPressed: () {
                            frenchPressed = true;
                            dripPressed = false;
                            continueAllowed = true;
                            deviceName = 'French Press';
                            setState(() {});
                          },
                        ),
                        Divider(
                          color: Color(0xFF4C748B),
                          height: 1,
                          thickness: 1,
                        ),
                        TextButton(
                          key: Key('dm-btn'),
                          style: ButtonStyle(alignment: Alignment.topLeft),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Drip Machine",
                                  key: Key('dm-btn-text'),
                                  style: TextStyle(
                                      color: Color(0xFF4C748B),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 1),
                                ),
                                Spacer(
                                  flex: 5,
                                ),
                                Icon(
                                  Icons.check,
                                  key: Key("Check2"),
                                  color: dripPressed
                                      ? Color(0xFF4C748B)
                                      : Color(0xFFFFFFFF),
                                )
                              ]),
                          onPressed: () {
                            dripPressed = true;
                            frenchPressed = false;
                            continueAllowed = true;
                            deviceName = 'Drip Machine';
                            setState(() {});
                          },
                        ),
                      ],
                    )),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: 46.0,
                width: 280.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        continueAllowed ? Color(0xFF4C748B) : Color(0xFFE2E2E2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: TextButton(
                    key: Key('chooseDevCont-btn'),
                    onPressed: continueAllowed
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InputCupsScreen(deviceName)));
                          }
                        : null,
                    child: Text(
                      "Continue",
                      key: Key('chooseDevCont-btn-text'),
                      style: continueAllowed
                          ? TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.white,
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
        ));
  }
}
