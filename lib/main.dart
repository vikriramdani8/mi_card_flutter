import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mi_card/post_result_model.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome()
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusLamp1 = false;
  bool statusLamp2 = false;
  bool statusLamp3 = false;
  bool statusLamp4 = false;

  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'My Home',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black87,
                      fontFamily: 'Opensans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color(int.parse('0xFFD2ECFF')),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(right: 25),
                              child: Image(
                                image: AssetImage('images/weather.png'),
                                height: 80,
                                alignment: Alignment.topRight,
                              ),
                            )
                        ), Expanded(
                            flex: 5,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Container(
                                    child: Text(
                                      '27',
                                      style: TextStyle(
                                        fontSize: 75,
                                        color: Colors.black87,
                                        fontFamily: 'Opensans',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      ' °C',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black87,
                                          fontFamily: 'Opensans',
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                      ]
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 20, left: 20, bottom: 5),
                  child: Text(
                    'Devices',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(top: 10, left: 20),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFFFEF5E6')),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(
                            Icons.tungsten,
                            color: Colors.black87,
                            size: 35
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(top: 10, left: 20),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFFE9E6F7')),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(
                            Icons.wifi,
                            color: Colors.black87,
                            size: 35
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(top: 10, left: 20),
                        decoration: BoxDecoration(
                          color: Color(int.parse('0xFFEFF7E4')),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(
                          Icons.thermostat,
                          color: Colors.black87,
                          size: 35
                        ),
                      ),
                    ],
                  ),
                ),

                // Lamp Row 1
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: EdgeInsets.all(20),
                  // color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // Lamp 1
                      Container(
                        width: MediaQuery.of(context).size.height * 0.20,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(int.parse('0xFFFBEBEA')),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                        Icons.tungsten,
                                        color: Colors.black54,
                                        size: 35
                                    ),
                                  ),
                                  Container(
                                    child: FlutterSwitch(
                                      width: 40.0,
                                      height: 25.0,
                                      valueFontSize: 12,
                                      toggleSize: 17,
                                      value: statusLamp1,
                                      borderRadius: 15.0,
                                      padding: 5.0,
                                      showOnOff: false,
                                      onToggle: (value) {
                                        setState(() {
                                          statusLamp1 = !statusLamp1;
                                          var lamp = statusLamp1 ? "1" : "0";
                                          PostResult.connectToApi(lamp, "lamp1").then((value) {
                                            postResult = value;
                                            print("Berhasil input");
                                          });
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                'Lamp 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Opensans',
                                ),
                              ),
                            )
                          ]
                        ),
                      ),

                      //Lamp 2
                      Container(
                        width: MediaQuery.of(context).size.height * 0.20,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFFEEF5E3')),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                          Icons.tungsten,
                                          color: Colors.black54,
                                          size: 35
                                      ),
                                    ),
                                    Container(
                                      child: FlutterSwitch(
                                        width: 40.0,
                                        height: 25.0,
                                        valueFontSize: 12,
                                        toggleSize: 17,
                                        value: statusLamp2,
                                        borderRadius: 15.0,
                                        padding: 5.0,
                                        showOnOff: false,
                                        onToggle: (value) {
                                          setState(() {
                                            statusLamp2 = !statusLamp2;
                                            var lamp = statusLamp2 ? "1" : "0";
                                            PostResult.connectToApi(lamp, "lamp2").then((value) {
                                              postResult = value;
                                              print("Berhasil input");
                                            });
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'Lamp 2',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Opensans',
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ),

                // Lamp Row 2
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // Lamp 3
                      Container(
                        width: MediaQuery.of(context).size.height * 0.20,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFFCFECF4')),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                          Icons.tungsten,
                                          color: Colors.black54,
                                          size: 35
                                      ),
                                    ),
                                    Container(
                                      child: FlutterSwitch(
                                        width: 40.0,
                                        height: 25.0,
                                        valueFontSize: 12,
                                        toggleSize: 17,
                                        value: statusLamp3,
                                        borderRadius: 15.0,
                                        padding: 5.0,
                                        showOnOff: false,
                                        onToggle: (value) {
                                          setState(() {
                                            statusLamp3 = !statusLamp3;
                                            var lamp = statusLamp3 ? "1" : "0";
                                            PostResult.connectToApi(lamp, "lamp3").then((value) {
                                              postResult = value;
                                              print("Berhasil input");
                                            });
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'Lamp 3',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Opensans',
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),

                      // Lamp 4
                      Container(
                        width: MediaQuery.of(context).size.height * 0.20,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFFE9E6F7')),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                          Icons.tungsten,
                                          color: Colors.black54,
                                          size: 35
                                      ),
                                    ),
                                    Container(
                                      child: FlutterSwitch(
                                        width: 40.0,
                                        height: 25.0,
                                        valueFontSize: 12,
                                        toggleSize: 17,
                                        value: statusLamp4,
                                        borderRadius: 15.0,
                                        padding: 5.0,
                                        showOnOff: false,
                                        onToggle: (value) {
                                          setState(() {
                                            statusLamp4 = !statusLamp4;
                                            var lamp = statusLamp4 ? "1" : "0";
                                            PostResult.connectToApi(lamp, "lamp4").then((value) {
                                              postResult = value;
                                              print("Berhasil input");
                                            });
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'Lamp 4',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Opensans',
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}
