import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'appColors.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  double _currentValue = 0.0;
  double _maxValue = 1.0; // This is 100% progress


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.font,  // To match the black background
      body: Column(children: [
        Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height*0.35,
              child: Image.network(
                'https://via.placeholder.com/400x200',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Centered Play/Pause button
            Container(
              width: width * 0.3,  // Ensure width and height are equal
              height: width * 0.3, // Use the same value for height
              decoration: BoxDecoration(
                // color: const Color(0xff7c94b6),

                borderRadius: BorderRadius.all( Radius.circular(50.0)),

                border: Border.all(
                  color: AppColors.background,
                  width: 2.0,
                ),
              ),
              child: Icon(Icons.play_arrow,size: 60,color: AppColors.grey,),
            ),
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.fullscreen,color: AppColors.background,size: 25,)),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 12,right: 12),
          //color: Colors.red,
          child: Row(
            children: [
              Text(
                "20:30",
                style: TextStyle(fontSize: 12, color: AppColors.background),
              ),
              SizedBox(width: width*0.01), // Adds some spacing between the text and progress bar
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0, // Set progress bar height
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0), // Red dot as thumb
                    thumbColor: Colors.red, // Color of thumb
                    activeTrackColor: Colors.red, // Progress color
                    inactiveTrackColor: Colors.white, // Remaining progress color
                  ),
                  child: Slider(
                    value: _currentValue,
                    min: 0,
                    max: _maxValue,
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(width: width*0.01), // Adds some spacing between the text and progress bar
              Text(
                "20:30",
                style: TextStyle(fontSize: 12, color: AppColors.background),
              ),
            ],
          ),
        ),

      ],// Loading spinner while video is loading
      ),
    );
  }
}
