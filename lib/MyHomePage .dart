import 'package:flutter/material.dart';

class MyHomePage  extends StatefulWidget {
  const MyHomePage ({super.key});
 // final String title;

  @override
  State<MyHomePage > createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading excel files"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //    title: Text(widget.tit),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),

    );
  }
}
