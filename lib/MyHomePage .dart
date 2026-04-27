import 'dart:collection';
import 'package:flutter/material.dart';
import 'handlingExcelFiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage  extends StatefulWidget {
  const MyHomePage ({super.key});
 // final String title;

  @override
  State<MyHomePage > createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {

  List<List<String>> storData = [];
  List<Map<String, dynamic>> firebaseData = [];
  List<String> departments = ["cs", "it", "is"];

  TextEditingController fileName=TextEditingController();

  Excelfiles excelObj=new Excelfiles();

  String? searchDep;

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
          children: <Widget>[
            SizedBox(height: 7),
            TextFormField(
              controller: fileName,
              decoration: InputDecoration(
                labelText: 'file Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    String? path = await excelObj.pickFile();

                    if(path != null){
                      fileName.text = path.split('/').last;
                      storData = await excelObj.readFile(path);
                      setState(() {

                      });
                    }
                  },
                  child: const Text('Chose an excel file'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () async {
                      await excelObj.uploadToFb(storData);
                    },
                    child: Text("Upload To Firebase"),
                ),
              ],
            ),
            SizedBox(height: 5,),

            DropdownButton<String>(
              value: searchDep,
              hint: Text("chose department if you want"),
              items: departments.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (Value) {
                setState(() {
                  searchDep = Value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                var results = await excelObj.readAllDoc(fdepart: searchDep);
                setState(() {
                  firebaseData = results;
                });
              },
              child: Text("Show from firebase"),
               ),

          Expanded(
            child: ListView.builder(
              itemCount: firebaseData.length,
              itemBuilder: (context, index) {
                return ListTile(

                  title: Text(firebaseData[index]['name']),
                  subtitle: Text("department: ${firebaseData[index]['department']} | ID: ${firebaseData[index]['id']}"),
                );
              },
            ),
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          await excelObj.deletAllDoc();
          setState(() {
            firebaseData = [];
            searchDep = null;
            storData = [];
            fileName.clear();
          });
        },
        child: Icon(Icons.clear, color: Colors.white),
      ),
    );
  }
}
