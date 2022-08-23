import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ชื่อรายการ'),
                autofocus: true, //ทำให้เข้าหน้านี้มาโฟกัสต้องกรอกตรงนี้ก่อน
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'จำนวนเงิน'),
                keyboardType: TextInputType.number, // ให้ป้อนได้แค่ตัวเลข
              ),
              FlatButton(
                color: Color.fromARGB(255, 86, 214, 204),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('เพิ่มข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
