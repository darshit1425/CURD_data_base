import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Database? database;

  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "my.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE parents(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,phone TEXT,notes TEXT)";

        db.execute(query);
      },
    );
  }

  void insertData({
    required name,
    required phone,
  }) async {
    database = await checkDB();
    database!.insert("parents", {
      "name": name,
      "phone": phone,
    });
  }

  Future<List<Map>> ReadData() async {
    database = await checkDB();

    String query = "SELECT * FROM parents";
    List<Map> list = await database!.rawQuery(query);
    print("${list}");
    return list;
  }

  Future<void> deleteData({required id}) async {
    database = await checkDB();
    database!.delete("parents", where: "id=?", whereArgs: [id]);
  }

//     update

  void updateData({
    required id,
    required name,
    required phone,
  }) {
    database!.update(
      "parents",
      {
        "name": name,
        "phone": phone,
      },
      whereArgs: [id],
      where: "id=?",
    );
  }
}
