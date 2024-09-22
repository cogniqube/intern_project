import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/charging.dart';
import 'package:intern_project/pages/profile/poin_withdrawl.dart'; 

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  int _counter = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: const Text("Points"),
      ),
      body: SingleChildScrollView( // Allow scrolling
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'My point',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$_counter Points',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Withdrawal Application screen
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const PointWithrawl()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Withdrawal application'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PointPurchaseBottomSheet()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Charging'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Wrap the DataTable in a SingleChildScrollView
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Date and time')),
                    DataColumn(label: Text('How to use it')),
                    DataColumn(label: Text('Point')),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 200 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 500 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Withdrawal')),
                        DataCell(Text('- 5,000 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Charging')),
                        DataCell(Text('+ 3,000 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2020.11.27 01:12(Fri)')),
                        DataCell(Text('Acquired (quiz)')),
                        DataCell(Text('+ 100 points')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
