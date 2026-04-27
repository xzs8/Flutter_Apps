import 'package:file_picker/file_picker.dart';
import 'package:flutter_excel/excel.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';


class Excelfiles {
    pickFile() async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['xlsx']
        );
        if (result != null) {
            return result.files.single.path;
        } else {
            return null;
        }
    }

    readFile(String path) async {
        var byte = File(path).readAsBytesSync();
        var excel = Excel.decodeBytes(byte);

        List<List<String>> data = [];

        for (var table in excel.tables.keys) {
            for (var row in excel.tables[table]!.rows) {
                List<String> dataRow = [];
                for (var cell in row) {
                    dataRow.add(cell?.value.toString() ?? "");
                }

                data.add(dataRow);
            }
            break;
        }

        return data;
    }

    Future<void> uploadToFb(List<List<String>> data) async {
        var collection = FirebaseFirestore.instance.collection('st_mangamet');

        for (var row in data) {
            if (row.isNotEmpty) {
                await collection.add({
                    'name': row[0], // row [ name , department , id] ---- row[0] = name , row[1] = department
                    'department': row[1],
                    'id': row[2],
                });
            }
        }
    }
    
    Future<List<Map<String, dynamic>>> readAllDoc({String? fdepart}) async{
        Query query = FirebaseFirestore.instance.collection('st_mangamet');

        if (fdepart != null){
            query = query.where('department', isEqualTo: fdepart);
        }

        QuerySnapshot dsnap = await query.get();

        List<Map<String, dynamic>> temp_list = [];
        for (var doc in dsnap.docs) {
            Map<String, dynamic> dataMap = doc.data() as Map<String, dynamic>;
            temp_list.add(dataMap);
        }
        return temp_list;
    }
    
    Future<void> deletAllDoc() async {
        var collection = FirebaseFirestore.instance.collection('st_mangamet');
        var snapshot = await collection.get();
        for(var doc in snapshot.docs) {
            await doc.reference.delete();
        }
    }
}
