import 'package:flutter/material.dart';

class PointWithrawl extends StatefulWidget {
  const PointWithrawl({super.key});

  @override
  State<PointWithrawl> createState() => _PointWithrawlState();
}

class _PointWithrawlState extends State<PointWithrawl> {
  final _formKey = GlobalKey<FormState>();
  String? accountHolderName;
  String? bankName;
  String? withdrawalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: const Text('Withdrawal Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'My Point',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '31,000 Points',
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Withdrawal Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                const Text(
                  'The withdrawal amount starts at 30,000 points.',
                  style: TextStyle(fontSize: 14, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please enter the amount to be withdrawn.',
                    labelStyle: TextStyle(color: Colors.orange),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount.';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (int.parse(value) < 30000) {
                      return 'Minimum withdrawal amount is 30,000 points.';
                    }
                    withdrawalAmount = value; // Store the withdrawal amount
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'The Account Holder',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please enter the account holder\'s name.',
                    labelStyle: TextStyle(color: Colors.orange),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the account holder\'s name.';
                    }
                    accountHolderName = value; // Store the account holder's name
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Bank Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please enter the bank name.',
                    labelStyle: TextStyle(color: Colors.orange),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the bank name.';
                    }
                    bankName = value; // Store the bank name
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Bank Account Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please enter your account number including "-".',
                  style: TextStyle(fontSize: 14, color: Colors.orange),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Please enter the bank account number.',
                    labelStyle: TextStyle(color: Colors.orange),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the bank account number.';
                    }
                    if (!value.contains('-')) {
                      return 'Please enter a valid bank account number.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'The amount you applied for will be withdrawn only when the account number matches the depositor.',
                  style: TextStyle(fontSize: 14, color: Colors.orange),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Show confirmation dialog
                      _showConfirmationDialog(context);
                    }
                  },
                  child: const Text('Application'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Withdrawal Application'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bank Name: $bankName'),
              Text('Account Holder: $accountHolderName'),
              Text('Withdrawal Amount: $withdrawalAmount'),
              const SizedBox(height: 10),
              const Text(
                'Do you want to withdraw this amount?',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirmation dialog
                _showWithdrawalResultDialog(context);
              },
              child: const Text('Withdraw'),
            ),
          ],
        );
      },
    );
  }

  void _showWithdrawalResultDialog(BuildContext context) {
    final isSuccess = true; // Simulate success or failure

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Withdrawal Result'),
          content: Text(isSuccess ? 'Withdrawal Successful!' : 'Withdrawal Failed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
