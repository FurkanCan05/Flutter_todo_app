import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static const String databaseName = "odev6.sqlite";

  static Future<Database> accessDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(path)) {
      print("Database exist already");
    } else {
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return openDatabase(path);
  }
}
