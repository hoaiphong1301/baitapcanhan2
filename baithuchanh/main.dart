import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeChecker(),
    );
  }
}

class AgeChecker extends StatefulWidget {
  @override
  _AgeCheckerState createState() => _AgeCheckerState();
}

class _AgeCheckerState extends State<AgeChecker> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String result = "";

  void checkAge() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);

    if (name.isEmpty || age == null) {
      setState(() {
        result = "Vui lòng nhập đầy đủ thông tin";
      });
      return;
    }

    if (age > 65) {
      result = "$name là Người già";
    } else if (age >= 6 && age <= 65) {
      result = "$name là Người lớn";
    } else if (age >= 2 && age < 6) {
      result = "$name là Trẻ em";
    } else if (age > 0 && age < 2) {
      result = "$name là Em bé";
    } else {
      result = "Tuổi không hợp lệ";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THỰC HÀNH 01"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Họ và tên"),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Tuổi"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAge,
              child: Text("Kiểm tra"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}