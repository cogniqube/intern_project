import 'package:flutter/material.dart';
import 'package:intern_project/pages/Home/productScreen.dart';

import '../../styles/app_colors.dart';

class StoredGoods extends StatefulWidget {
  @override
  _StoredGoodsState createState() => _StoredGoodsState();
}

class _StoredGoodsState extends State<StoredGoods> {
  // Sample list of products (replace this with actual dynamic data)
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Sports gloves',
      'price': '25,000',
      'image': 'assets/images/cap.png',
      'quantity': '3'
    },
    {
      'name': 'Billiard balls',
      'price': '45,000',
      'image': 'assets/images/cap.png',
      'quantity': '2'
    },
    {
      'name': 'Sports shoes with sole',
      'price': '39,000',
      'image': 'assets/images/shoe.png',
      'quantity': '3'
    },
    {
      'name': 'Golf club',
      'price': '310,000',
      'image': 'assets/images/club.png',
      'quantity': '2'
    },
    {
      'name': 'Golf ball set',
      'price': '60,000',
      'image': 'assets/images/cap.png',
      'quantity': '3'
    },
    {
      'name': 'A white cap',
      'price': '39,000',
      'image': 'assets/images/cap.png',
      'quantity': '4'
    },

    {
      'name': 'Sports gloves',
      'price': '25,000',
      'image': 'assets/images/cap.png',
      'quantity': '3'
    },
    {
      'name': 'Billiard balls',
      'price': '45,000',
      'image': 'assets/images/cap.png',
      'quantity': '2'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The prize I have been stored",
          style: TextStyle(color: AppColors.font, fontSize: 16),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      body: products.isEmpty
          ? _buildEmptyState() // Show empty state if no products
          : _buildProductList(), // Show ListView if products are available
    );
  }

  // Build method for ListView when products are available
  Widget _buildProductList() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text widget showing the total number of cases
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'A total of ${products.length} cases',
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.font),

            ),
          ),

          // Expanded ListView for products
          Expanded(
            child: ListView.builder(
              itemCount: products.length, // Number of products in the list
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding( // Wrap with Padding to avoid layout issues
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded( // Add Expanded to ensure proper constraints
                        child: Card(
                          elevation:0.5,
                          shape: RoundedRectangleBorder(),
                          child: ListTile(
                            leading: Image.asset(
                              product['image'],
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*0.2,
                              fit: BoxFit.fill,
                              // fit: BoxFit.contain,
                            ),
                            title: Text(
                              product['name'],
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.font),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(product['price'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.font),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(" won",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.font),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Text("description",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.font),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      products.removeAt(index); // Remove product from the list
                                    });
                                  },
                                  child: Icon(Icons.remove_circle,
                                      size:25,color: AppColors.red),
                                ),

                                SizedBox(

                                  width: MediaQuery.of(context).size.width*0.14,

                                  child: Row(
                                    children: [
                                      Text(product['quantity'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.sponsor,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Text(' cases',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.sponsor
                                        ),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox( height: MediaQuery.of(context).size.height*0.01,),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build method for the empty state with a message and button
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(Icons.error_outline, color: AppColors.primary, size: 30),
            SizedBox( height: MediaQuery.of(context).size.height*0.02,),
            Text(
              "There are no products\nfor sale.",
              style: TextStyle(color: AppColors.primary, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, MediaQuery.of(context).size.height*0.06,),
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                "Put the products to be sold",
                style: TextStyle(color: AppColors.background,
                    fontSize: 14),
              ),
            ),
            SizedBox( height: MediaQuery.of(context).size.height*0.1,),
          ],
        ),
      ),
    );
  }
}
