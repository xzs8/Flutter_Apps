import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todos=[];

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todos.add(task);
      });
    }
  }

  void _removeToDoItem(int index){
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Simple To-Do-List"),
      ),
      body: Column(
          children: <Widget>[
            TextField(
              onSubmitted: _addToDoItem,
              decoration: InputDecoration(
                labelText: "Enter a new task",
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_todos[index]),
                        trailing: IconButton(
                          onPressed: () => _removeToDoItem(index),
                          icon: Icon(Icons.delete),
                        ),
                      );
                   },
                ),
            ),
          ],
        ),
      );

  }
}
