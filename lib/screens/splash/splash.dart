import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomate/screens/onboarding/onboarding.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void launchWithFullscreenMode() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // launchWithFullscreenMode();
      //checkSignedIn(); // write this methods for checking user information
      Navigator.pushReplacement(
          context, SlideTransitionRightToLeft(const OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Appstore.colorPLighter,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Appstore.colorPLighter,
        elevation: 0,
      ),
      backgroundColor: Appstore.colorPLighter,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.search,
              color: Appstore.colorWhite,
              size: 80,
            ),
            const SizedBox(height: 10),
            Text(
              Appstore.logoText,
              style: TextStyle(
                fontSize: Appstore.fontSizeHeading1,
                fontWeight: FontWeight.bold,
                fontFamily: Appstore.appFont,
                color: Appstore.colorWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
