import 'dart:async';
import 'dart:convert';
import 'package:depen/Album.dart';
import 'package:depen/FirstPage.dart';
import 'package:depen/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    SecondPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              //backgroundColor: Colors.blue,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.shifting,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    backgroundColor: Colors.amber,
                    icon: Icon(Icons.abc),
                    label: "página 1"),
                BottomNavigationBarItem(
                    backgroundColor: Colors.orange,
                    icon: Icon(Icons.access_alarm_rounded),
                    label: "página 45")
              ]),
          appBar: AppBar(
            title: const Text('Flutter ListView'),
            backgroundColor: Colors.orange,
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )),
    );
  }
}
