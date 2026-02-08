import 'package:flutter/material.dart';
import 'handlingExcelFiles.dart';


class MyHomePage  extends StatefulWidget {
  const MyHomePage ({super.key});
 // final String title;

  @override
  State<MyHomePage > createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {

  List<List<String>> storData = [];

  TextEditingController fileName=TextEditingController();

  Excelfiles excelObj=new Excelfiles();

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
            SizedBox(height: 5),
            ElevatedButton(onPressed: (){
               storData = [];
               fileName.clear();
               setState(() {

               });
             },
              child: Text("Clear")),
            Expanded(
              child: ListView.builder(
                itemCount: storData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      storData[index].join(" | "),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
