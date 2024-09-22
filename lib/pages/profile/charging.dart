import 'package:flutter/material.dart';

class PointPurchaseBottomSheet extends StatelessWidget {
   final List<PointOption> pointOptions = [
    PointOption(points: 1400, price: 1300),
    PointOption(points: 3000, price: 3900),
    PointOption(points: 5000, price: 6500),
    PointOption(points: 10000, price: 13000),
    PointOption(points: 50000, price: 65000),
    PointOption(points: 100000, price: 130000),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 48),
                    const Text(
                      'Point Purchase',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                '1,000 Points',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: pointOptions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.purple,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          '${pointOptions[index].points} Points',
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          '${pointOptions[index].price} won',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          // Handle the point purchase logic here
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PointOption {
  final int points;
  final int price;

  PointOption({required this.points, required this.price});
} 