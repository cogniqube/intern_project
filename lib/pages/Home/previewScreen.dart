import 'package:flutter/material.dart';
import 'package:routine/appColors.dart';
import 'package:routine/videoPlayerScreen.dart';

class PreviewScreen extends StatefulWidget {
  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

bool isRinging = false;

class _PreviewScreenState extends State<PreviewScreen> {
  final List<Map<String, dynamic>> previewData = [
    {
      "name": "Pak Se-ri",
      "time": "Saturday: 18:00",
      "message": "Let's play golf after knowing it!",
      "tag": "golf",
      "imageUrl": "https://via.placeholder.com/400x200",
      "avatarColor": AppColors.primary,
      // "avatarImage": "assets/images/1.png",
    },
    {
      "name": "Pak Se-ri",
      "time": "Saturday: 18:00",
      "message": "Let's play golf after knowing it!",
      "tag": "golf",
      "imageUrl": "https://via.placeholder.com/400x200",
      "avatarColor": AppColors.red,
      // "avatarImage": "assets/images/1.png",
    },
    {
      "name": "Pak Se-ri",
      "time": "Saturday: 18:00",
      "message": "Let's play golf after knowing it!",
      "tag": "golf",
      "imageUrl": "https://via.placeholder.com/400x200",
      "avatarColor": AppColors.red,
      // "avatarImage": "assets/images/1.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Collecting Previews",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: previewData.length,
          itemBuilder: (context, index) {
            final data = previewData[index];

            return Column(
              children: [
                Container(
                  height: height * 0.15,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: data["avatarColor"],
                            //  child: Image.asset(data["avatarImage"]),
                          ),
                          SizedBox(width: width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.font,
                                ),
                              ),
                              Text(
                                data["time"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.font,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                data["message"],
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.font,
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                data["tag"],
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Icon(
                                isRinging
                                    ? Icons.notifications_active
                                    : Icons.notifications_none,
                                color: isRinging
                                    ? AppColors.primary
                                    : AppColors.font,
                                size: 20,
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                "Notification",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isRinging
                                      ? AppColors.primary
                                      : AppColors.font,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.network(
                      data["imageUrl"],
                      width: double.infinity,
                      height: height * 0.2,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.fullscreen,
                          color: AppColors.font,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01),
                Container(
                  color: Colors.purple,
                  height: height * 0.05,
                  width: double.infinity,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Show dialog on button press
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text(
                                "This is not the scheduled broadcast time.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.font),
                              ),
                              content: Text(
                                "It can be broadcast from 10 minutes before the scheduled time.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14,color: AppColors.disablefont),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: GestureDetector(
                                      onTap:(){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close",
                                        style: TextStyle(fontSize: 18,color: AppColors.font),)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Live Reservation Request",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.01),
              ],
            );
          },
        ),
      ),
    );
  }
}
