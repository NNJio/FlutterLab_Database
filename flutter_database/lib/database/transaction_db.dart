import 'dart:io';
import 'package:flutter_database/models/transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName; //เก็บชื่อฐานข้อมูล

  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถูกสร้างไว้แล้ว => เปิด
  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    //หาตำแหน่งที่จัดเก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    //สร้างตัวเก็บตำแหน่งไฟล์ของ Database
    String dbLocation = join(appDirectory.path, dbName);
    // สร้าง database
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  // บันทึกข้อมูล
  Future<int> InsertData(Transactions statement) async {
    // ฐานข้อมูล => store
    // tansaction.db => expense
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");

    // json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyID;
  }

  // ดึงข้อมูล
  Future<bool> loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    List transactionList = <Transactions>[];
    // ดึงข้อมูลมาทีละแถว
    for(var record in snapshot){
      transactionList.add(
        Transactions(
          title: record["title"], 
          amount: record["amount"], 
          date: record["date"],
          )
      );
    }
    return true;
  }
}
