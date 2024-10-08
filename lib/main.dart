import 'package:flutter/material.dart';
import 'package:intern_project/pages/Feed/feed_page.dart';
import 'package:intern_project/pages/Login/login.dart';
import 'package:intern_project/pages/Login/splash.dart';
import 'package:intern_project/pages/Test_page.dart'; 
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
            titleTextStyle: AppText.appBar,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.background,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.unselectedButton,
          ),
        ),
        //home: loginPage(),
        initialRoute: '/',
        routes:{
          '/': (context) => Splash()
          // '/feed': (context) => FeedPage(),
          // '/main': (context) => const MainPage()
    },
    );
  }
}
