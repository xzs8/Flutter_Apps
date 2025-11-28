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
  TextEditingController _controller = TextEditingController();
  String text1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,
      title: Text('handle user input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 90,
                child: Text(text1,style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'What\'s in your mind?',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: (){
                      _controller.clear();
                    },
                    icon: Icon(Icons.clear)
                ),
              ),
            ),
            MaterialButton(
                onPressed: (){
                  setState(() {
                    text1 = _controller.text;
                  });
                },
              color: Colors.blue,
              child: Text('Press'),
            ),
          ],
        ),
      ),
    );
  }
}
