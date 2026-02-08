import 'package:file_picker/file_picker.dart';
import 'package:flutter_excel/excel.dart';
import 'dart:io';


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
}