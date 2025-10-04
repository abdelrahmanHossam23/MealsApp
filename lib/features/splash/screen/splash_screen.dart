import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:meals_app/features/onBoarding/screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isPassOnBoarding = prefs.getBool("pass_onBoarding");
      if(isPassOnBoarding != null && isPassOnBoarding == true){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
      }else{
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnBoarding();
          },
        ),
      );
      }
    
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(child: Lottie.asset("assets/animations/splash.json")),
    );
  }
}
