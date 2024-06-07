import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection {
  Future<Database> setDataBase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "MyDBExample");

    var database = await openDatabase(path, version: 1, onCreate: CreateTable);

    return database;
  }

  Future<void> CreateTable(Database database, int version) async {
    String? sql =
        "create table student (id integer primary key AUTOINCREMENT, name text, subject text, marks text)";

    await database.execute(sql);
  }
}
