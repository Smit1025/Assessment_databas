import 'package:flutter/material.dart';
import 'package:flutter1/offline_Asiment/dataBaseconnection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DataBaseConnection _dataBaseConnection;
  Repository() {
    _dataBaseConnection = DataBaseConnection();
  }

  static Database? _database;

  Future<Database> get myDatabase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _dataBaseConnection.setDataBase();
      return _database!;
    }
  }

  insertRecord(table, data) async {
    var con = await myDatabase;
    return await con.insert(table, data);
  }

  fetchRecord(table) async {
    var con = await myDatabase;
    return await con.query(table);
  }

  fetchsingleRecord(table, data) async {
    var con = await myDatabase;
    return await con.query(table, where: "id = ?", whereArgs: [data["id"]]);
  }

  deleteRecord(table, data) async {
    var con = await myDatabase;
    return await con.delete(table, where: "id = ?", whereArgs: [data["id"]]);
  }

  updateRecord(table, data) async {
    var con = await myDatabase;
    return await con
        .update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }
}
