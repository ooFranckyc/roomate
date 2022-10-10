import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:roomate/screens/authentification/register/register.dart';
import 'package:roomate/screens/home/home.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<PageViewModel> pageViewModelList = [
    PageViewModel(
      titleWidget: Text(
        "Find a roommate",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appstore.colorDark1,
            fontFamily: Appstore.appFont,
            fontSize: Appstore.fontSizeHeading1),
      ),
      useScrollView: true,
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          Appstore.boardingTextDesc1,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Appstore.colorDark2,
              fontFamily: Appstore.appFont,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      image: Center(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(Appstore.boardingImage3))),
    ),
    PageViewModel(
      titleWidget: Text(
        "Find an apartment",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appstore.colorDark1,
            fontFamily: Appstore.appFont,
            fontSize: Appstore.fontSizeHeading1),
      ),
      useScrollView: true,
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          Appstore.boardingTextDesc1,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Appstore.colorDark2,
              fontFamily: Appstore.appFont,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      image: Center(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(Appstore.boardingImage2))),
    ),
    PageViewModel(
      titleWidget: Text(
        "Welcome To Find it",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appstore.colorDark1,
            fontFamily: Appstore.appFont,
            fontSize: Appstore.fontSizeHeading2),
      ),
      useScrollView: true,
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          Appstore.boardingTextDesc1,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Appstore.colorDark2,
              fontFamily: Appstore.appFont,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      image: Center(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(Appstore.boardingImage1))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Appstore.colorWhite,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Appstore.colorWhite,
          elevation: 0,
        ),
        backgroundColor: Appstore.colorWhite,
        body: IntroductionScreen(
          pages: pageViewModelList,
          showBackButton: false,
          showSkipButton: true,
          skip: Bounce(
            duration: const Duration(milliseconds: 180),
            onPressed: () {
              Navigator.pushReplacement(
                  context, SlideTransitionRightToLeft(const HomeScreen()));
            },
            child: Text(
              Appstore.skipButtonText,
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: Appstore.fontSizeHeading3,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.normal),
            ),
          ),
          animationDuration: 50,
          curve: Curves.easeInOutCubicEmphasized,
          globalBackgroundColor: Appstore.colorWhite,
          next: Bounce(
            duration: const Duration(milliseconds: 180),
            onPressed: () {},
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Appstore.colorPLighter,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: Appstore.colorWhite,
                )),
          ),
          done: Bounce(
            duration: const Duration(milliseconds: 180),
            onPressed: () {
              Navigator.pushReplacement(
                  context, SlideTransitionRightToLeft(const RegisterScreen()));
            },
            child: Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                  color: Appstore.colorPLighter,
                  borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              child: Text(
                Appstore.buttonGetStartedBoring,
                style: TextStyle(
                    color: Appstore.colorWhite,
                    fontSize: 15,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(15.0),
            activeSize: const Size(25.0, 15.0),
            activeColor: Appstore.colorPLighter,
            color: Appstore.colorDark3,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          ),
          onDone: () {},
          onSkip: () {
            // You can also override onSkip callback
          },
        ));
  }
}
