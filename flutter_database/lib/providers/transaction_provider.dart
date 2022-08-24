import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Transaction> transactions = [
    Transaction(title: "ซื้อหนังสือ", amount: 500, date: DateTime.now()),
    Transaction(title: "ซื้อเสื้อผ้า", amount: 900, date: DateTime.now()),
    Transaction(title: "ซื้อกางเกง", amount: 400, date: DateTime.now()),
    Transaction(title: "ซื้อนาฬิกา", amount: 5500, date: DateTime.now()),
  ];
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
