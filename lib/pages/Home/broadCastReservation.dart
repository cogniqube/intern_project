
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intern_project/pages/Home/productScreen.dart';
import 'package:intl/intl.dart';

import '../../styles/app_colors.dart';

class BroadCastReservation extends StatefulWidget {
  const BroadCastReservation({super.key});

  @override
  _BroadCastReservationState createState() => _BroadCastReservationState();
}

class _BroadCastReservationState extends State<BroadCastReservation> {

  int _quizProgress = 1; // Default selection
  String? selectedTime = "00:00";
  Color _textColor = AppColors.primary; // Initial text color (before selection)
  TextEditingController _timeController = TextEditingController(); // Controller for the Time TextField
  TextEditingController _textController = TextEditingController(); // Controller for the Broadcast Name TextField
  TextEditingController _dateController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _timeController.text = "00:00"; // Initial value of the time field
  }
  final List<String> imagePaths = [
    "assets/images/shoe.png",
    "assets/images/club.png",
    "assets/images/cap.png",

  ];

  void _onRequestReservation() {
    // Retrieve text from controllers
    String showName = _textController.text;
    String scheduledDate = _dateController.text;
    String scheduleTime = _timeController.text;

    // Check if required fields are filled
    if (showName.isNotEmpty && scheduledDate.isNotEmpty && scheduleTime.isNotEmpty) {
      _showReservationCompletionDialog(); // Show reservation completion dialog
    } else {
      _showWarningDialog(); // Show warning dialog
    }
  }
  void _showReservationCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("I applied for a live reservation",
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.font
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("The live application has been",
                        style: TextStyle(color: AppColors.font,
                            fontSize: 12)),
                    Text("completed with what you entered.",
                        style: TextStyle(color: AppColors.font,
                            fontSize: 12)),
                    Text("A separate e-mail will be sent.",
                        style: TextStyle(color: AppColors.font,
                            fontSize: 12)),
                    Text("Thank You.",
                      style: TextStyle(color: AppColors.font,
                          fontSize: 12),)
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Divider(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text("Confirm", style: TextStyle(fontSize: 14, color: AppColors.font)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.all(20),
          child: Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height*0.42,
            //width: MediaQuery.of(context).size.height*0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Request to enter essential",
                    style: TextStyle(fontSize: 16,
                        color: AppColors.font)),
                Text("information.",
                    style: TextStyle(fontSize: 16,
                        color: AppColors.font)),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 8),
                  child: Column(
                    children: const [
                      Text("In order to host the show, the minimum",
                          style: TextStyle(color: AppColors.font,
                              fontSize: 12)),
                      Text("information is...",
                          style: TextStyle(color: AppColors.font,
                              fontSize: 12)),
                      Text("Please input it.",
                          style: TextStyle(color: AppColors.font, fontSize: 12)),
                      SizedBox(height: 10),
                      Text("Required: Name of the show, scheduled",
                          style: TextStyle(color: AppColors.primary,
                              fontSize: 12)),
                      Text("date of the show, and whether to proceed",
                          style: TextStyle(color: AppColors.primary,
                              fontSize: 12)),
                      Text("with the quiz.",
                          style: TextStyle(color: AppColors.primary,
                              fontSize: 12)),
                      Text("Choice: Live preview video and image,",
                          style: TextStyle(color: AppColors.primary,
                              fontSize: 12)),
                      Text("Choose a product to sell.",
                          style: TextStyle(color: AppColors.primary,
                              fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Divider(),

                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text("Confirm",style: TextStyle(fontSize: 14, color: AppColors.font)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFileAttachPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel_outlined,color: AppColors.background,size: 20,)),
            Dialog(
              insetPadding: EdgeInsets.only(left: 12,right: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child:Container(
                height: MediaQuery.of(context).size.height*0.65,
                padding: EdgeInsets.only(left: 16,right: 16,top: 30),
                //width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Icon(Icons.collections_outlined,size: 20,color: AppColors.font,),
                      SizedBox(width: 10,),
                      Text(
                        "Uploading an image",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:AppColors.font),
                      ),
                    ],),


                    SizedBox(height: MediaQuery.of(context).size.height*0.01),

                    const Text(
                      "The image is an image used as a thumbnail, and only files up to 10MB or less can be uploaded.",
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height*0.01),
                    // in case when image is slected
                    // Row(
                    //   children: [
                    //     Text("Image File name.mp4",style: TextStyle(color: AppColors.purple,fontSize: 12),),
                    //     SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                    //     Icon(Icons.cancel_rounded,color: AppColors.purple,size: 15,)
                    //   ],
                    // ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.01),

                    OutlinedButton(
                      onPressed: _showSelectDialog,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0, color: AppColors.primary), // Border width and color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Flat edges for a rectangular shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Uploading an Image',
                          style: TextStyle(color: AppColors.primary,fontSize: 16), // Text color
                        ),
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.01),
                    Row(children: [
                      Icon(Icons.smart_display_outlined,size: 20,color: AppColors.font,),
                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                      Text(
                        "Uploading a preview video",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:AppColors.font),
                      ),
                    ],),

                    SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                    const Text(
                      "The preview video is a video that viewers can watch before watching the broadcast, and only files up to 350MB or less can be uploaded.",
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.01),
                    // in case when vvideo is selected
                    // Row(
                    //   children: [
                    //     Text("Video File name.mp4",style: TextStyle(color: AppColors.purple,fontSize: 12),),
                    //    SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                    //     Icon(Icons.cancel_rounded,color: AppColors.purple,size: 15,)
                    //   ],
                    // ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.01),
                    OutlinedButton(
                      onPressed: _showSelectDialog,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0, color: AppColors.primary), // Border width and color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Flat edges for a rectangular shape
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Uploading a preview video',
                          style: TextStyle(color: AppColors.primary,fontSize: 16), // Text color
                        ),
                      ),
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height*0.02),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Images and preview videos are optional.",
                            style: TextStyle(fontSize: 12, color: AppColors.primary),
                          ),
                          Text(
                            "Up to one image and one preview can be uploaded.",
                            style: TextStyle(fontSize: 12, color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),



            ),
          ],
        );
      },
    );
  }
  void _showSelectDialog() {

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height*0.3,
        // width: 335
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (BuildContext context) {
        return Container(
          //color: Colors.red,
          // height: MediaQuery.of(context).size.height*0.4,
          padding: const EdgeInsets.all(12),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                //   color: Colors.red,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Upload an image',
                        style: TextStyle(fontSize: 14, color: AppColors.font),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle camera tap
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text('Camera',style: TextStyle(fontSize: 14,color: AppColors.grey,)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle gallery tap
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text('Gallery',style: TextStyle(fontSize: 14,color: AppColors.grey,)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
// SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Card(
                //color: Colors.blueGrey,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text('Cancel',style: TextStyle(fontSize: 14,color: AppColors.font,)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Method to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy.MM.dd').format(pickedDate);
      });
    }
  }

  void dispose() {
    _dateController.dispose();
    _textController.dispose(); // Dispose controller when not needed
    _timeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        title: const Text('Application for live broadcast reservation',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.bold,
                color: AppColors.font)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Broadcast Name
                  Text(
                    "broadcast name",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: height*0.01),
                  const Text(
                    "The broadcast name is the content that is shown to users at the time of notice.",
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.font,
                    ),
                  ),
                  SizedBox(height: height*0.015),
                  Container(
                    height: height*0.06,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter the broadcast name.",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightorange, // 30% opacity of #E66100
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(),
                          borderSide: BorderSide(color: AppColors.primary), // Set to primary color when focused
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02),

                  // Scheduled Broadcast Date
                  Text(
                    "Schedule broadcast date",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    "The broadcast will run for one hour from the selected time.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.font,
                    ),
                  ),
                  SizedBox(height: height*0.02),
                  Row(
                    children: [
                      // Date Field
                      // Date Field
                      Container(
                        width: width*0.46,
                        height: height*0.06,
                        child: TextField(
                          controller: _dateController,
                          readOnly: true,

                          onTap: () => _selectDate(context),
                          style: TextStyle(
                            fontSize: 14,
                            color: _dateController.text.isEmpty
                                ? AppColors.lightorange  // Use light orange when empty
                                : AppColors.primary,     // Use primary color when there's text
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10,left: 20),
                            border: const OutlineInputBorder(),
                            hintText: "YYYY.MM.DD",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: AppColors.lightorange, // 30% opacity of #E66100
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(),
                              borderSide: BorderSide(color: AppColors.primary),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(),
                              borderSide: BorderSide(color: AppColors.primary), // Set to primary color when focused
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: width*0.03),
                      // Time Dropdown Field

                      Container(
                        width: width * 0.42,
                        height: height * 0.06,
                        child: TextField(
                          controller: _timeController,
                          readOnly: true, // Prevent direct user input
                          style: TextStyle(color: _textColor, fontSize: 14), // Set the text color dynamically
                          decoration: InputDecoration(
                            hintText: "00:00", // Default hint when no time is selected
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightorange, // Set hint text color to light orange
                            ),
                            contentPadding: EdgeInsets.only(bottom: 10,left: 20),
                            border: const OutlineInputBorder(),
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.lightorange,
                                size: 25,
                              ),
                              onSelected: (String value) {
                                setState(() {
                                  // Update the time field with the selected value
                                  _timeController.text = value; // Only display the time (e.g., "18:00")
                                  _textColor = AppColors.primary; // Change text color to light orange
                                });
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: "18:00 Possibility",
                                  child: Row(
                                    children: [
                                      Text(
                                        "18:00", // The time
                                        style: TextStyle(
                                          color: AppColors.font, // Regular text color
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 5), // Space between time and message
                                      Text(
                                        "Possibility", // Additional message
                                        style: TextStyle(
                                          color: AppColors.primary, // Orange color for the message
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: "18:30 Not a Possibility",
                                  child: Row(
                                    children: [
                                      Text(
                                        "18:30", // The time
                                        style: TextStyle(
                                          color: AppColors.font,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Not a Possibility", // Additional message
                                        style: TextStyle(
                                          color: AppColors.grey, // Grey for non-available option
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: "19:00 Possibility",
                                  child: Row(
                                    children: [
                                      Text(
                                        "19:00", // The time
                                        style: TextStyle(
                                          color: AppColors.font,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Possibility", // Additional message
                                        style: TextStyle(
                                          color: AppColors.primary, // Orange color for the message
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(),
                              borderSide: BorderSide(color: AppColors.primary),),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.vertical(),
                              borderSide: BorderSide(color: AppColors.primary),// Customize the border color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02),

                  // Quiz Progress
                  const Text(
                    "Quiz progress",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Questions are asked through separate consultation with OneQ Co., Ltd.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.font,
                    ),
                  ),
                  SizedBox(height: height*0.01),
                  Row(
                    children: [
                      SizedBox(
                        width:width*0.35,
                        height: height*0.08,
                        // color: Colors.blue,
                        child: RadioListTile<int>(
                          contentPadding: EdgeInsets.only(right: 10),
                          value: 1,
                          groupValue: _quizProgress,
                          title: Text(
                            'Proceed',
                            style: TextStyle(
                              color: AppColors.font,
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _quizProgress = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: width*0.01,),
                      SizedBox(
                        width:width*0.55,
                        height: height*0.08,
// color: Colors.red,
                        child: RadioListTile<int>(
                          value: 2,
                          contentPadding: EdgeInsets.only(right: 10),
                          groupValue: _quizProgress,
                          title: Text(
                            'It does not proceed',
                            style: TextStyle(
                              color: AppColors.font,
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _quizProgress = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),

                  // Live Preview Video and Images
                  const Text(
                    "Live preview video and images",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Attach a video preview and images that viewers will see before the broadcast starts.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.font,
                    ),
                  ),

                  SizedBox(height: height*0.01,),
                  Container(
                    height: height*0.06,
                    child:  TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Attach videos and images",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightorange, // 30% opacity of #E66100
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(),
                          borderSide: BorderSide(color: AppColors.primary), // Set to primary color when focused
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showFileAttachPopup();

                          }, icon:Icon(Icons.attach_file_sharp,color: AppColors.primary,size: 20,),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  const Text(
                    "Attachments can be registered up to 1 photo (10MB or less) and 1 video (350MB or less).",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.font,
                    ),
                  ),
                  SizedBox(height: height*0.02,),

                  // Select Products to Sell
                  const Text(
                    "Select products to sell",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Search for the product you want to sell and register it.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.font,
                    ),                  ),
                  SizedBox(height: height*0.01,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductListScreen()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF2B705),
                        minimumSize:  Size(double.infinity, height*0.06),
                        shape: RoundedRectangleBorder()
                    ),
                    child: Text("Select products to sell",
                      style: TextStyle(
                          color: AppColors.background, fontSize: 14),),
                  ),
                  SizedBox(height: height*0.03,),

                  // No Products Registered
                  Center(
                    child: Text(
                      "There is no registered product.",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.font,
                      ),                               ),
                  ),
                  SizedBox(height: height*0.01,),
                  // when products are selected
                  // SizedBox(
                  //   height: height*0.14,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: imagePaths.length,
                  //     itemBuilder: (context, index) {
                  //       return Stack(
                  //         children: [
                  //           Container(
                  //             width: width * 0.22,
                  //             // height: height * 0.12,
                  //             margin: EdgeInsets.symmetric(horizontal: 4),
                  //            // color: Colors.red,
                  //             child:
                  //             Center(
                  //                 child:
                  //                 Image.asset(
                  //                   imagePaths[index],
                  //                   // height: height * 0.1,
                  //                   width: width*0.22,
                  //                   fit: BoxFit.contain,
                  //
                  //                 )
                  //             ),
                  //
                  //
                  //
                  //           ),
                  //           Positioned(
                  //               top: 0,
                  //               right: 0,
                  //               child: GestureDetector(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       imagePaths.removeAt(index); // Remove product from the list
                  //                     });
                  //                   },
                  //                   child: Icon(Icons.cancel,size: 15,color: AppColors.font,))),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),


                  SizedBox(height: height*0.01,),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: _onRequestReservation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff693ACC),
                minimumSize: Size(double.infinity, height*0.06),
                shape: RoundedRectangleBorder(),
              ),
              child: const Text(
                "Request for reservation",
                style: TextStyle(
                    color: AppColors.background, fontSize: 14),),              ),

            SizedBox(height: height*0.02,),

          ],
        ),
      ),
    );


  }
}


