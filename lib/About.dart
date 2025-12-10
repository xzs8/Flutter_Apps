import 'package:flutter/material.dart';
import 'main.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('About us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('Welcome to our app', style: TextStyle(fontSize: 40),),
              MaterialButton(
                shape: StadiumBorder(),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                color: Colors.green,
                child: Text('Back', style: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      ),
    );
  }
}
