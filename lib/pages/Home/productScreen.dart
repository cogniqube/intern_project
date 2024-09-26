import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';
import 'storedGoods.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  String searchResult = '';
  int quantity = 1;
  bool isOpened=false;
  List<Map<String, dynamic>> filteredProducts = [];
  List<Map<String, dynamic>> selectedProducts = []; // Global list to hold selected products

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Sports shoes with sole',
      'price': '39,000 won',
      'image': 'assets/images/shoe.png',
    },
    {
      'name': 'Golf club',
      'price': '310,000 won',
      'image': 'assets/images/club.png',
    },
    {
      'name': 'Golf ball set',
      'price': '60,000 won',
      'image': 'assets/images/cap.png',
    },
    {
      'name': 'A white cap',
      'price': '39,000 won',
      'image': 'assets/images/cap.png',
    },
    {
      'name': 'Sports gloves',
      'price': '25,000 won',
      'image': 'assets/images/cap.png',
    },
    {
      'name': 'Billiard balls',
      'price': '45,000 won',
      'image': 'assets/images/cap.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initially display all products
    filteredProducts = products;
  }

  void _performSearch() {
    String query = _searchController.text.toLowerCase();
    List<Map<String, dynamic>> temp = products.where((product) {
      return product['name'].toLowerCase().contains(query);
    }).toList();

    setState(() {
      filteredProducts = temp;
      searchResult = 'I searched "$query" and found ${filteredProducts.length} cases.';
    });
  }

  void _showCapacityDialog(String image, String name, String price) {
    showModalBottomSheet(
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Close icon aligned to the right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel_outlined, color: AppColors.font, size: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    // Image and text aligned in a row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          image,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height * 0.03),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.font,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                              Text(
                                price,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Drop-down menu with capacity options
                    TextField(
                      controller: _capacityController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Measure of capacity",
                        hintStyle: TextStyle(color: AppColors.grey),
                        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.1),
                        suffixIcon: PopupMenuButton<String>(
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(maxWidth: double.infinity),
                          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
                          onSelected: (String value) {
                            _capacityController.text = value;
                            setModalState(() {
                              isOpened = false;
                            });
                          },
                          onCanceled: () {
                            setModalState(() {
                              isOpened = false;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            setModalState(() {
                              isOpened = true;
                            });
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: "11, graphite, golf bag set, genuine product",
                                child: Text("11, graphite, golf bag set, genuine product"),
                              ),
                              PopupMenuItem<String>(
                                value: "7, graphite, golf set, genuine product",
                                child: Text("7, graphite, golf set, genuine product"),
                              ),
                              PopupMenuItem<String>(
                                value: "11, graphite, golf bag set, genuine product",
                                child: Text("11, graphite, golf bag set, genuine product"),
                              ),
                              PopupMenuItem<String>(
                                value: "7, graphite, golf set, genuine product",
                                child: Text("7, graphite, golf set, genuine product"),
                              ),
                            ];
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    if (isOpened)
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Quantity adjustment row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setModalState(() {
                              quantity++;
                            });
                          },
                          child: Icon(Icons.add, color: AppColors.font, size: 20),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                        Text(quantity.toString(), style: TextStyle(fontSize: 12, color: AppColors.font)),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                        GestureDetector(
                          onTap: () {
                            setModalState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          child: Icon(Icons.remove, color: AppColors.font, size: 20),
                        ),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    // "Put it in" button
                    ElevatedButton(
                      onPressed: () async {
                        if (_capacityController.text.isEmpty) {
                          _showErrorMessageAboveModal(); // Show overlay error message above the modal
                        } else {
                          bool? isConfirmed = await _showProductSelectedDialog();
                          if (isConfirmed == true) {
                            setModalState(() {
                              final selectedProduct = {
                                'name': name,
                                'price': price,
                                'image': image,
                                'quantity': quantity,
                              };
                              selectedProducts.add(selectedProduct); // Add product globally
                              Navigator.pop(context, selectedProduct); // Pass product back
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.sponsor,
                        minimumSize: Size(double.infinity, MediaQuery.of(context).size.height * 0.08),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Text(
                        "Put it in",
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  bool showError = false;

// Function to display the overlay error message above the modal bottom sheet
  void _showErrorMessageAboveModal() {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height * 0.67, // Position the message above the modal
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        // top: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width*0.7,
            //padding: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Please select an option.',
                style: TextStyle(color: AppColors.font, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );

    // Insert the overlay entry
    overlayState?.insert(overlayEntry);

    // Remove the overlay after 2 seconds
    Future.delayed(Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }

  Future<bool?> _showProductSelectedDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The product was included in\nthe product to be sold with the \noption you choose",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.font,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: Divider(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Pop the dialog and return true for confirmation
                        Navigator.pop(context, true); // Pass `true` when confirmed
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(fontSize: 14, color: AppColors.font,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose a product to sell",
          style: TextStyle(fontSize: 18, color: AppColors.font),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.font,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  StoredGoods()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,

                          decoration: InputDecoration(
                            hintText: 'Enter the product name',
                            hintStyle: TextStyle(fontSize: 14,color: AppColors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // border: InputBorder.none,

                            suffixIcon: searchResult.isNotEmpty?
                            IconButton(
                              icon: Icon(Icons.clear,size: 20,color: AppColors.font,),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  filteredProducts = products;
                                  searchResult = '';
                                });
                              },
                            ):null,
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.01),
                      SizedBox(
                        width: width * 0.25, // Adjusted width to make the button smaller
                        height: height*0.05, // Reduced height for a more compact button
                        child: ElevatedButton(
                          onPressed: _performSearch,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Centers the content horizontally
                            children: [
                              Text(
                                'search',
                                style: TextStyle(
                                  color: AppColors.background,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Icon(
                                Icons.search,
                                size: 14, // Reduced icon size for a smaller look
                                color: AppColors.background,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10), // Adjust padding for compact look
                            backgroundColor: AppColors.primary, // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16), // Reduced corner radius for less rounded edges
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: height*0.01),
                if (searchResult.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchResult,
                          style: TextStyle(color: AppColors.primary, fontSize: 12),
                        ),
                        Spacer(),
                        Icon(
                          Icons.restart_alt,
                          color: AppColors.font,
                          size: 20,
                        ),
                        SizedBox(width: width*0.01), // Optional spacing between icon and text
                        Text(
                          "Originally",
                          style: TextStyle(color: AppColors.font, fontSize: 12),
                        ),
                      ],
                    ),
                  )

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8),
                          child: Row(

                            children: [
                              Container(
                                width:width*0.26,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [      Text(
                                    product['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                    Text(product['price']),
                                  ],),
                              ),
                              SizedBox(width: width*0.01,),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.add_circle, color: AppColors.primary,size: 30,),
                                    onPressed: () {
                                      _showCapacityDialog(
                                        product["image"],
                                        product["name"],
                                        product["price"],
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),

                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
