import 'package:flutter/material.dart';
import 'package:intern_project/pages/Login/splash.dart';
import 'package:intern_project/pages/Test_page.dart';
import 'package:intern_project/pages/feed_page.dart'; 
import 'package:intern_project/pages/main_page.dart';
import 'package:intern_project/styles/App_text.dart';
import 'package:intern_project/styles/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appbar,
            foregroundColor: Colors.white,
            elevation: 4,
            centerTitle: false,
            titleTextStyle: AppText.header1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.background,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.black,
          ),
        ),
        //home: loginPage(),
        initialRoute: '/',
        routes:{
          '/': (context) => Splash(),
          '/feed': (context) => FeedPage(),
          '/main': (context) => MainPage()
    },
    );
  }
}
