import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Db_Helper {
  Db_Helper._();
  static Db_Helper db_helper = Db_Helper._();
  Database? database;

  Future<Database?> checkdb() async {
    if (database != null) {
      return database;
    } else {
      return await createDb();
    }
  }

  Future<Database> createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'news.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE news(id INTEGER PRIMARY KEY AUTOINCREMENT,image TEXT,title TEXT,content TEXT,desc Text)";
        db.execute(query);
      },
    );
  }

  Future<void> insertData({required String title, required String content, required String image,required String desc}) async {
    database = await checkdb();
    database!
        .insert('news', {'title': title, 'content': content, 'image': image,'desc':desc});
  }

  Future<List<Map>> readData() async {
    database = await checkdb();
    String query ="SELECT * FROM news";
    List<Map> dataList =await database!.rawQuery(query);
    return dataList;
  }

  Future<void> deleteData(int id) async {
    database = await checkdb();
    database!.delete('news',where: "id = ?",whereArgs: [id]);
  }
}
