import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {

  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   int count = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
          child: Text(
        'This is counter: $count',
        style: TextStyle(
            fontSize: 30, color: Colors.white),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count ++;
          });
        },
          child: Icon(Icons.add),
      ),
    );
  }
}
