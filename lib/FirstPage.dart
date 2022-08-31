import 'dart:ffi';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final myController = TextEditingController();
  late bool b = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: Container(
            //color: Colors.amber,
            width: 500,
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.amber),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                    onChanged: (value) {
                      b = !b;
                      print(b);
                    },
                    onSubmitted: (value) {
                      print(myController.text);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text(myController.text),
                          );
                        },
                      );
                    },
                    controller: myController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Como te chamam?',
                      labelText: 'Nome',
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 75,
                    width: 500,
                    color: b ? Colors.blue : Colors.orange,
                    // ignore: prefer_const_constructors
                    child: Center(
                      // ignore: prefer_const_constructors
                      child: Text(myController.text),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 50,
                    width: 50,
                    //color: c ? Colors.black : Colors.white,
                    // ignore: prefer_const_constructors
                    child: Center(
                        // ignore: prefer_const_constructors
                        //child: Text("oi"),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
