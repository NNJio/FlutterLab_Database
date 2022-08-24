// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

// controller
  final titleController = TextEditingController(); //รับค่าชื่อรายการ
  final amountController = TextEditingController(); //รับค่าจำนวนเงิน

  FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ชื่อรายการ'),
                autofocus: true, //ทำให้เข้าหน้านี้มาโฟกัสต้องกรอกตรงนี้ก่อน
                controller: titleController,
                validator: (String? str) {
                  //ชื่อรายการเป็นค่าว่าง
                  if (str!.isEmpty) {
                    return "กรุณาป้อนชื่อรายการ";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'จำนวนเงิน'),
                keyboardType: TextInputType.number, // ให้ป้อนได้แค่ตัวเลข
                controller: amountController,
                validator: (String? str) {
                  //ชื่อรายการเป็นค่าว่าง
                  if (str!.isEmpty) {
                    return "กรุณาป้อนจำนวนเงิน";
                  }
                  if (double.parse(str) <= 0) {
                    return "กรุณาป้อนจำนวนเงินมากกว่า 0";
                  }
                  return null;
                },
              ),
              FlatButton(
                color: const Color.fromARGB(255, 86, 214, 204),
                textColor: Colors.white,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    //เตรียมข้อมูลไป provider
                    Transaction statement = Transaction(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now(),
                    ); //jobject

                    //เรียก provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);

                    Navigator.pop(context);
                  }
                },
                child: const Text('เพิ่มข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
