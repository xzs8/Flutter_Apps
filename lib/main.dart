import 'dart:math';

import 'package:flutter/material.dart';

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
TextEditingController controller1 = TextEditingController();
String intext = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,
      title: Text('handle user input'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                child: Text(intext, style: TextStyle(color: Colors.blue, fontSize: 40)),
              ),
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                hintText: 'What\'s in your mind?',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: (){
                      controller1.clear();
                    },
                    icon: Icon(Icons.clear),
                ),
              ),
            ),
            MaterialButton(
                onPressed: (){
                  setState(() {
                    intext = controller1.text;
                  });
                },
              color: Colors.blue,
              child: Text("Click me", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),

    );
  }
}
