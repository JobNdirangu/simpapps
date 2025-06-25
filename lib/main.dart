import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdditionPage(),
    );
  }
}

class AdditionPage extends StatefulWidget {
  const AdditionPage({super.key});

  @override
  _AdditionPageState createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String result = '';

  Future<void> addNumbers() async {
    try {
      var dio = Dio();
      final String url="http://192.168.132.112:5000/api/add";
      final formData=FormData.fromMap({
          'num1': num1Controller.text,
          'num2': num2Controller.text,
      });
      final response = await dio.post(url,data:formData);
      setState(() {        
        result = response.data['result'].toString();
      });
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Numbers'),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: 'Number 1',border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              
              
            ),
            SizedBox(height: 15,),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: 'Number 2',border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNumbers,
              child: Text('Add'),
            ),
            SizedBox(height: 20),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}
