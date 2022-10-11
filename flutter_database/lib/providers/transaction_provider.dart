import 'package:flutter/material.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Transactions> transactions = [];
  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transaction.db");
    //บันทึกข้อมูล
    await db.InsertData(statement);

    // ดึงข้อมูลมาแสดงผล
    transactions = db.loadAllData() as List<Transactions>;
    
    // แจ้งเตือนไปที่ consumer
    notifyListeners();
  }
}
