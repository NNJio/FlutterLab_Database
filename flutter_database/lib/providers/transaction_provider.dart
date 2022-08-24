import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Transaction> transactions = [];
  //ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.insert(0,statement);
    // แจ้งเตือนไปที่ consumer
    notifyListeners();
  }
}
