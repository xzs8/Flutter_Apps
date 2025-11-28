import 'dart:math';

import 'package:flutter/material.dart';
import 'About.dart'
    '';
void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,
      title: Text('Home page'),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click to know about us.', style: TextStyle(fontSize: 30),),
            Container(
              child: MaterialButton(
                shape: StadiumBorder(),
                color: Colors.orange,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => about()));
                  },
                  child: Text('Click me', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
