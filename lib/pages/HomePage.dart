import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intern_project/pages/Home/storedGoods.dart';
import 'package:intern_project/pages/Home/previewScreen.dart';
import 'package:intern_project/pages/Home/productScreen.dart';
import '../styles/App_text.dart';
import '../styles/app_colors.dart';
import 'package:intern_project/styles/app_colors.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  int _selectedIndex = 0;
  List<bool> isFollowingList = [false, false, false];
  List<Widget> carouselItems = [
    Image.asset('assets/images/1.png'),
    Image.asset('assets/images/1.png'),
    Image.asset('assets/images/1.png'),
  ];

  bool isEventActive = true;
  bool isRinging = false;
  Timer? _timer;
  DateTime eventTime = DateTime.now().add(Duration(hours: 4));
  String displayMessage = "";

  bool hasAskedPermission = false;

  @override
  void initState() {
    super.initState();
    _startNotificationAndToastTimer();
    _updateEventMessage();
  }

  // Update message based on time difference
  void _updateEventMessage() {
    DateTime now = DateTime.now();
    Duration difference = eventTime.difference(now);

    String message = difference.inDays >= 1
        ? "It's scheduled to air tomorrow at ${DateFormat('h:mm a').format(eventTime)} | Pak Se-ri"
        : "It's scheduled to air today at ${DateFormat('h:mm a').format(eventTime)} | Pak Se-ri";


    setState(() {
      displayMessage = message;
    });
  }

  // Timer for both toast and notification messages
  void _startNotificationAndToastTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (timer.tick <= 6) {
        _showToastAndNotification(timer.tick);
      }
      if (timer.tick == 1) {
        _checkNotificationPermission(); // First tick to check permission
      }
      if (timer.tick >= 6) {
        timer.cancel(); // Stop timer after 60 seconds
      }
    });
  }

  // Show both toast and notification depending on the tick count
  void _showToastAndNotification(int tick) {
    String message = "";
    if (tick == 6) {
      message = "Event starts now!";
    } else {
      message = "Event starts in ${60 - tick * 10} seconds";
    }

    // Display toast (bottom) and notification (top)
    Fluttertoast.showToast(
      msg: "Toast Message $tick: $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 12.0,
    );

    if (tick == 1 || tick == 3 || tick == 6) {
      Fluttertoast.showToast(
        msg: "Notification $tick: $message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  Future<void> _checkNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isGranted) {
      setState(() {
        isRinging = true;
      });
    } else if (!hasAskedPermission) {
      _showPermissionDialog();
      hasAskedPermission = true;
    }
  }

  Future<void> _requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      setState(() {
        isRinging = true;
      });
    } else {
      setState(() {
        isRinging = false;
      });
    }
  }

  // Dialog for permission request
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Center(
            child: Text(
              'in OneQ Live\nI want to send you a\nnotification.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          content: Text(
            'Warning, sound and icon badges\ncan be included in notifications.\nYou can configure this in settings.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.grey,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: EdgeInsets.only(left: 18, right: 28),
          actions: [
            TextButton(
              child: Text(
                'not allowed',
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isRinging = false;
                });
              },
            ),
            TextButton(
              child: Text(
                'Permit',
                style: TextStyle(color: Colors.blue, fontSize: 14.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _requestNotificationPermission();
              },
            ),
          ],
        );
      },
    );
  }
  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.only(top: 20,bottom: 20,left: 10),
          shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            // width: MediaQuery.of(context).size.width * 0.9, // 80% of the screen width
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height*0.4, // Adjust height as per requirement

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "OneQ Studio Co., Ltd.",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 50,),
                    Text("View bussiness\nInformation",style: TextStyle(fontSize: 8),)
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  //color: Colors.pink,
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ceo",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Company Registration\nNumber",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Mail-order bussines\nreport",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Adress",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Main Phone",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Email",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                      SizedBox(width: 25), // Add spacing between columns
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          Text("tea Tour",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("466-88-908763\n",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("2020,Location Information-Join Number\n2nd Floor, 204, Seocho dearo 50-gil.",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("Seocho-gu, Seoul",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("15XX-XXXX",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 5,),
                          Text("help@onecue.co",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),// Pushes buttons to the bottom
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add action for Terms of Use
                        },
                        child: Text("Terms of Use"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add action for Privacy Policy
                        },
                        child: Text("Privacy Policy"),
                      ),
                    ],
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Check if the bell is ringing to show the dialog
    if (isRinging) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPermissionDialog();
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      // Custom AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            '루틴라이브',
            style: TextStyle(
              color: AppColors.orange,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.font,
            ),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  StoredGoods()),
            );},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with Glassmorphic Container and Notification Icon Below
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            'https://via.placeholder.com/400x200',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          // Glassmorphic Container for "It will air after ..." text
                          Positioned(
                            bottom: 10,
                            left: 90,
                            right: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'It will air after',
                                        style: TextStyle(
                                            color: AppColors.font, fontSize: 12),
                                      ),SizedBox(width:width*0.01),
                                      Text(
                                        '06:12:59',
                                        style: TextStyle(
                                            color: AppColors.purple, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                height: height*0.03,
                                width: width*0.12,
                                child: Center(
                                  child: Text(
                                    "Golf",
                                    style: TextStyle(
                                        fontSize: 12, color: AppColors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primary,
                                ),
                              ))
                        ],
                      ),
                      // Notification Icon below the image
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        // color: Colors.red,
                        height: height*0.1,
                        child: Row(
                          children: [
                            SizedBox(
                              //color: Colors.lightBlue,
                              width: width*0.68,

                              child: Column(
                                children: [
                                  Text(
                                    "No more equipment. It's time to improve!",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.font
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: displayMessage.split('|')[0], // Text before the vertical bar
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.font, // Color before the vertical bar
                                          ),
                                        ),
                                        TextSpan(
                                          text: " | Pak Se-ri", // Text after the vertical bar
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.purple, // Color after the vertical bar
                                          ),
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width*0.05,
                            ),
                            Container(
                              // color: Colors.blueAccent,
                              child: Column(
                                children: [
                                  Icon(
                                    // Change the icon when ringing
                                    isRinging ? Icons.notifications_active : Icons.notifications_none,
                                    color: isRinging ? AppColors.primary : AppColors.font, // Change color based on ringing state
                                    size: 20, // Made size larger for clarity
                                  ),
                                  SizedBox(height: 5),
                                  Text("Notification",
                                    //  isRinging ? "Ringing" : "Notification", // Change text based on ringing state
                                    style: TextStyle(
                                      fontSize: 12, // Increased font size for better visibility
                                      color: isRinging ? AppColors.primary : AppColors.font, // Match the color with the icon
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // Main Content

                      SizedBox(height: height * 0.02),
                      // Recommended Products Section
                      Text(
                        'Recommended product',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],),
                ),

                SizedBox(height: height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: height * 0.32,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        productCard('Running shoes', '39,000 won', '10%',
                            'assets/images/1.png'),
                        productCard('Driver golf club', '589,000 won', '20%',
                            'assets/images/1.png'),
                        productCard('Driver golf club', '589,000 won', '20%',
                            'assets/images/1.png'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductListScreen()),
                        );},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 2.0, color: AppColors.primary), // Border width and color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0), // Flat edges for a rectangular shape
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'See more products',
                            style: TextStyle(color: AppColors.primary), // Text color
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),
                      // Scheduled Live Section
                      Text(
                        'Schedule Live',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: height*0.22,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","Catch ball"),
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","archery"),
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","billiards"),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PreviewScreen()),
                        );
                        // Define what happens when the button is pressed
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.0, color: AppColors.primary), // Border width and color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Flat edges for a rectangular shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Collecting previews',
                          style: TextStyle(color: AppColors.primary), // Text color
                        ),
                      ),
                    ),
                      SizedBox(height: height * 0.02),
                      // Play Live Section
                      Text(
                        'Play Live',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: height*0.22,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","Catch ball"),
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","archery"),
                        liveShowCard("Let’s catch the\ncatch ball. Let's\ncatch it together.","billiards"),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: OutlinedButton(
                    onPressed: () {

                      // Define what happens when the button is pressed
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 2.0, color: AppColors.primary), // Border width and color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            0), // Flat edges for a rectangular shape
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Watch more Shows',
                        style: TextStyle(color: AppColors.primary), // Text color
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Stack(
              children: [
                CarouselSlider(
                  items: carouselItems
                      .map((item) => Container(
                    width: width,
                    child: item,
                  ))
                      .toList(),
                  options: CarouselOptions(
                    height: height * 0.3,
                    autoPlay: true,
                    enlargeCenterPage: false,  // Disable enlargement to prevent extra space
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,  // Full width images
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  top: 100, // Adjust positioning
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(carouselItems.length, (index) {
                        return AnimatedContainer(
                          duration: Duration(seconds: 2),
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: activeIndex == index ? 10.0 : 8.0,
                          height: activeIndex == index ? 10.0 : 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: activeIndex == index ? AppColors.background : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            // Recommended Celebrities Section
            Container(
              height: height*0.58,
              //color: Colors.blue,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Recommended Celebrity',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.font,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Container(
                    height: height*0.48,
                    //color: Colors.red,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        celebrityCard('Pak Se-ri', 'World-class golf that you\nlearn from professionals!',
                            'assets/images/1.png', 1900, 0),
                        celebrityCard('Park Chan-ho', 'World-class golf that you\nlearn from professionals!',
                            'assets/images/1.png', 20000, 1),
                        celebrityCard('Park Ji-sung', 'World-class golf that you\nlearn from professionals!',
                            'assets/images/1.png', 31000, 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: height*0.05,),
            Container(
              height: height*0.1,
              color: AppColors.font,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("One Q Studio Co., Ltd.",style: TextStyle(fontSize: 12,color: AppColors.background),),
                            SizedBox(width: width*0.01,),
                            GestureDetector(child: Icon(Icons.keyboard_arrow_down,size: 15,color: AppColors.background),
                              onTap:(){
                                showPopup(context);
                              },)
                          ],
                        ),
                        SizedBox(height: height*0.01,),
                        Text("See the bussines information",style: TextStyle(fontSize: 8,color: AppColors.background)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Terms and Conditions",style: TextStyle(fontSize: 9,color: AppColors.background),),
                        Text("Personal information and processing policy",style: TextStyle(fontSize: 9,color: AppColors.background),)

                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: height*0.08, // Increase height
              child: Icon(Icons.home, size: 30), // Larger icon
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: height*0.08, // Increase height
              child: Icon(Icons.chat, size: 30), // Match "Feed" icon
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: height*0.08, // Increase height
              child: Icon(Icons.card_giftcard, size: 30), // Adjusted icon
            ),
            label: 'Store', // Change label to 'Store'
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: height*0.08, // Increase height
              child: Icon(Icons.person, size: 30), // Adjusted icon size
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary, // Highlight color for selected item
        unselectedItemColor: Color(0x4D303030),  // Color for unselected items
        type: BottomNavigationBarType.fixed, // Labels always visible
        iconSize: 30, // Adjust icon size for consistency
        selectedFontSize: 14, // Adjust text size
        unselectedFontSize: 12, // Adjust text size for unselected
      ),

    );
  }

  // Helper methods for sections
  Widget productCard(
      String title, String price, String discount, String imagePath) { return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      width: MediaQuery.of(context).size.width*0.5,
      //color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.16,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Center(
                        child: Text(
                          "It's almost",
                          style: TextStyle(
                              fontSize: 12, color: AppColors.background),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.purple,
                      ),
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, top: 5),
                  width: MediaQuery.of(context).size.width*0.35,
                  //  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          color: AppColors.font,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$discount ',
                            style: TextStyle(fontSize: 14,color: AppColors.purple),
                          ),
                          Text(
                            '$price',
                            style: TextStyle(fontSize: 14,color: AppColors.font),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.03,
                ),
                CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.sponsor,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          size: 15,
                          color: AppColors.background,
                        ),
                        //               color: AppColors.textColor,),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Row(
                children: [
                  Stack(
                    clipBehavior:
                    Clip.none, // Allow circles to overflow the container
                    children: [
                      Positioned(
                        right: -40, // Overlap to the left
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.red, // Red above the blue
                          // child:Image.asset("assets/images/1.png"),
                        ),
                      ),
                      Positioned(
                        right: -20, // Overlap further to the left
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor:
                          Colors.pink, // Pink on top of red and blue
                          // child:Image.asset("assets/images/1.png"),
                        ),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue, // Blue at the bottom
                        //    child:Image.asset("assets/images/1.png"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.16,
                  ),
                  Icon(
                    Icons.workspace_premium,
                    size: 20,
                    color: AppColors.purple,
                  ),
                  Text(
                    "Celeb reco-\nmmendation",
                    style: TextStyle(color: AppColors.purple, fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget liveShowCard(String title,String subbox) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(0), // Optional: Adding rounded corners
        ),
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/images/1.png',
              height: MediaQuery.of(context).size.height*0.4,
              // width: MediaQuery.of(context).size.width*0.4,
              fit: BoxFit.fill, // Ensures the image covers the entire container
            ),
            // Title Text Positioned at the bottom
            Positioned(
              bottom: 5,
              left: 5,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.background, // Ensure it's visible over the image
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
                top: 5,
                left: 5,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.18,
                      child: Center(
                        child: Text(
                          "$subbox",
                          style: TextStyle(
                              fontSize: 10, color: AppColors.background),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.purple,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.12),
                    Icon(Icons.notifications_none_sharp,size: 20,color: AppColors.background,)
                  ],
                ))
            // Subtitle Text Positioned slightly above the bottom

          ],
        ),
      ),
    );
  }

  Widget celebrityCard(String name, String description, String imagePath,int value, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/1.png",
                width: MediaQuery.of(context).size.width*0.45,

                height: MediaQuery.of(context).size.height*0.18,
                fit: BoxFit.cover),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(
                    width: MediaQuery.of(context).size.width*0.22,
                    child: Text('$name',
                      style: AppText.subtitle2,
                      overflow: TextOverflow.ellipsis,)),

                SizedBox(width: MediaQuery.of(context).size.width*0.05,),

                Row(
                  children: [
                    CircleAvatar(radius:8,backgroundColor: Colors.purple,
                      child: Center(
                          child: Text("F",
                            style: TextStyle(fontSize: 10,
                                color: AppColors.background),)),),
                    SizedBox( width: MediaQuery.of(context).size.width*0.02,),
                    Text("$value",style: TextStyle(color: AppColors.font,fontSize: 14))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text('$description', style: TextStyle(fontSize: 12,color: Colors.grey)),
            ),

            Row(
              children: [
                _buildHashtagContainer("#ProfessionalGolf"),
                SizedBox( width: MediaQuery.of(context).size.width*0.02,),
                _buildHashtagContainer("#GolfEmpress"),
              ],
            ),
            SizedBox( height: MediaQuery.of(context).size.height*0.01,),
            _buildHashtagContainer("#LessonGenius"),
            SizedBox( height: MediaQuery.of(context).size.height*0.02,),
            GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle the follow state for the specific button
                  isFollowingList[index] = !isFollowingList[index];
                });
              },
              child: Container(
                height:MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.width*0.36,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: isFollowingList[index] ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Center(
                  child: Text(
                    isFollowingList[index] ? 'Following' : 'Follow',
                    style: TextStyle(
                      color: isFollowingList[index] ? AppColors.background : AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }
}

Widget _buildHashtagContainer(String hashtag) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.font),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      hashtag,
      style: TextStyle(fontSize: 8,color: AppColors.font),
    ),
  );
}

