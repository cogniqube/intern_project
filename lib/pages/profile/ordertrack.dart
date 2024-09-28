import 'package:flutter/material.dart';
import 'package:intern_project/pages/profile/shoppinginfo.dart'; 

class OrderTrackingScreen extends StatelessWidget {
  final List<OrderItem> orders = [
    OrderItem(
      date: '2021.01.25',
      status: 'It\'s being delivered',
      productName: '11 types of vivid golf balls',
      productImage: 'assets/profile/gulf.png',
      price: 36000,
      isCancelable: true,
    ),
    OrderItem(
      date: '2021.01.20',
      status: 'Delivery complete',
      productName: 'Muscle training. Rubber...',
      productImage: 'assets/profile/and.jpg',
      price: 4800,
      isCancelable: false,
      showReturnExchangeButtons: true,
    ),
    OrderItem(
      date: '2021.01.20',
      status: 'Delivery complete',
      productName: 'Running shoes with com...',
      productImage: 'assets/profile/shoes.png',
      price: 100000,
      isCancelable: false,
      showReturnExchangeButtons: true,
    ),
    OrderItem(
      date: '2021.01.15',
      status: 'Canceled',
      productName: 'Nike W Daybreak',
      productImage: 'assets/profile/mike.png',
      price: 100000,
      isCancelable: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: const Text('Order / Tracking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ShoopingInfo()), // Replace with your LoginScreen widget
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderItem order;

  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.date,
              style: const TextStyle(color: Colors.orange, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  order.productImage,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: order.status.contains('delivered')
                                  ? Colors.purple
                                  : order.status == 'Canceled'
                                      ? Colors.grey
                                      : Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              order.status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        order.productName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('${order.price} won'),
                    ],
                  ),
                ),
              ],
            ),
            if (order.isCancelable) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Handle Order cancellation
                    },
                    child: const Text('Order cancellation'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle Tracking
                    },
                    child: const Text('Tracking'),
                  ),
                ],
              ),
            ],
            if (order.showReturnExchangeButtons) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Handle Request for return
                    },
                    child: const Text('Request for return'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle Request for an exchange
                    },
                    child: const Text('Request an exchange'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class OrderItem {
  final String date;
  final String status;
  final String productName;
  final String productImage;
  final int price;
  final bool isCancelable;
  final bool showReturnExchangeButtons;

  OrderItem({
    required this.date,
    required this.status,
    required this.productName,
    required this.productImage,
    required this.price,
    this.isCancelable = false,
    this.showReturnExchangeButtons = false,
  });
}
