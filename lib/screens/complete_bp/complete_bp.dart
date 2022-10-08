import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/home.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';
import 'package:roomate/utils/widgets/searchbar.dart';

class CompleteBuildProfile extends StatefulWidget {
  const CompleteBuildProfile({super.key});

  @override
  State<CompleteBuildProfile> createState() => _CompleteBuildProfileState();
}

class _CompleteBuildProfileState extends State<CompleteBuildProfile> {
  int cibp = 0;
  bool fakeLoading = false;

  List<String> listAppbarTitle = const [
    "Personal habits and\npreferences",
    "Interests and hobbies",
    "Personal Traits",
    "Language",
  ];

  List<Widget> buildProfileAssembly = const [
    PreferentHIH(), // preferents habits , Interests and hobbies
    InterestHobbie(),
    PersonalTraits(),
    LanguagePreferences()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: () {},
                      child: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Appstore.colorPLighter,
                            shape: BoxShape.circle),
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          color: Appstore.colorWhite,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      listAppbarTitle[cibp],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: Appstore.appFont,
                          color: Appstore.colorDark1),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                buildProfileAssembly[cibp],
                const SizedBox(height: 30),
                cibp == 3
                    ? Bounce(
                        duration: const Duration(milliseconds: 210),
                        onPressed: () {
                          // continue to homepage
                          setState(() {
                            fakeLoading = true;
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            // wait a few minutes left, your should saved all data take from all last screen
                            // then push to home screen
                            Navigator.pushReplacement(context,
                                SlideTransitionRightToLeft(const HomeScreen()));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: PrimaryButton(
                              color: Appstore.colorPLighter,
                              text: fakeLoading
                                  ? "Please wait..."
                                  : "Process to home page",
                              width: Appstore.debugValueDefault,
                              margin: Appstore.defaultMarginButton),
                        ),
                      )
                    : Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          switch (cibp) {
                            case 0:
                              setState(() {
                                cibp = 1;
                              });
                              break;
                            case 1:
                              setState(() {
                                cibp = 2;
                              });
                              break;
                            case 2:
                              setState(() {
                                cibp = 3;
                              });
                              break;
                            default:
                          }
                          //log(cibp.toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: PrimaryButton(
                              color: Appstore.colorPLighter,
                              text: "Next",
                              width: Appstore.debugValueDefault,
                              margin: Appstore.defaultMarginButton),
                        ),
                      )
              ],
            )),
      ),
    );
  }
}

class PreferentHIH extends StatefulWidget {
  const PreferentHIH({super.key});

  @override
  State<PreferentHIH> createState() => _PreferentHIHState();
}

class _PreferentHIHState extends State<PreferentHIH> {
  int currentIndexS1 = 3,
      currentIndexS2 = 3,
      currentIndexS3 = 3,
      currentIndexS4 = 4,
      currentIndexS5 = 3,
      currentIndexS6 = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Choices
          foodChoiceWidget(),
          guestSection(),
          drinkingChoice(),
          partyPrefs(),
          pets(),
          smokingChoices()
        ],
      ),
    );
  }

  Widget foodChoiceWidget() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Food Choices",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS1 = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS1 == 0
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Veg",
                      style: TextStyle(
                          color: currentIndexS1 == 0
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS1 = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS1 == 1
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Non veg",
                      style: TextStyle(
                          color: currentIndexS1 == 1
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS1 = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentIndexS1 == 2
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Other",
                      style: TextStyle(
                          color: currentIndexS1 == 2
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Please specfify other:",
                  style: TextStyle(
                      color: Appstore.colorDark1,
                      fontSize: 15,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                    child: SizedBox(
                  child: TextFormField(),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget guestSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Guest",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS2 = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS2 == 0
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Often",
                      style: TextStyle(
                          color: currentIndexS2 == 0
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS2 = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS2 == 1
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Occasinally",
                      style: TextStyle(
                          color: currentIndexS2 == 1
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS2 = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentIndexS2 == 2
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Never",
                      style: TextStyle(
                          color: currentIndexS2 == 2
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget drinkingChoice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Drinking Choices",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS3 = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS3 == 0
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Often",
                      style: TextStyle(
                          color: currentIndexS3 == 0
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS3 = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentIndexS3 == 1
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Occasinally",
                      style: TextStyle(
                          color: currentIndexS3 == 1
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      currentIndexS3 = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentIndexS3 == 2
                            ? Appstore.colorPLighter
                            : Appstore.colorDark3,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Text(
                      "Never",
                      style: TextStyle(
                          color: currentIndexS3 == 2
                              ? Appstore.colorWhite
                              : Appstore.colorDark1,
                          fontWeight: FontWeight.w500,
                          fontFamily: Appstore.appFont,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget partyPrefs() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Party Preferences",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS4 = 0;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS4 == 0
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Daily",
                            style: TextStyle(
                                color: currentIndexS4 == 0
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS4 = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS4 == 1
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Occasinally",
                            style: TextStyle(
                                color: currentIndexS4 == 1
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS4 = 2;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS4 == 2
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Rarely",
                            style: TextStyle(
                                color: currentIndexS4 == 2
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS4 = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentIndexS4 == 3
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Weekends",
                            style: TextStyle(
                                color: currentIndexS4 == 3
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pets() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pets",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS5 = 0;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS5 == 0
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Have",
                            style: TextStyle(
                                color: currentIndexS5 == 0
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS5 = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS5 == 1
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Don't Have",
                            style: TextStyle(
                                color: currentIndexS5 == 1
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS5 = 2;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS5 == 2
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "May Have",
                            style: TextStyle(
                                color: currentIndexS5 == 2
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smokingChoices() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smoking Choices",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS6 = 0;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS6 == 0
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Often",
                            style: TextStyle(
                                color: currentIndexS6 == 0
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS6 = 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS6 == 1
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Occasionally",
                            style: TextStyle(
                                color: currentIndexS6 == 1
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            currentIndexS6 = 2;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: currentIndexS6 == 2
                                  ? Appstore.colorPLighter
                                  : Appstore.colorDark3,
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Never",
                            style: TextStyle(
                                color: currentIndexS6 == 2
                                    ? Appstore.colorWhite
                                    : Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestHobbie extends StatefulWidget {
  const InterestHobbie({super.key});

  @override
  State<InterestHobbie> createState() => _InterestHobbieState();
}

class _InterestHobbieState extends State<InterestHobbie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchBar(),
        const SizedBox(
          height: 15,
        ),
        listInterrestWidget()
      ],
    );
  }

  List<String> listInterestName = [
    "Music",
    "Traveiling",
    "Dancing",
    "Reading",
    "Swinning",
    "Gymn",
    "Football",
    "Cooking",
    "Baking",
    "Shopping",
    "Movies",
    "Drawing",
    "Yoga",
    "Foodle",
    "Design",
    "Anime",
    "Tennis",
    "Cyling",
    "Painting",
    "Gaming",
    "Sleeping",
  ];

  List<bool> listInterrestCheckSelected = [];

  Widget interestButton({required String name, required int index}) {
    for (int i = 0; i < listInterestName.length; i++) {
      listInterrestCheckSelected.add(false);
    }
    return Bounce(
      duration: const Duration(milliseconds: 180),
      onPressed: () {
        setState(() {
          listInterrestCheckSelected[index] =
              !listInterrestCheckSelected[index];
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: listInterrestCheckSelected[index]
                ? Appstore.colorPLighter
                : Appstore.colorDark3,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Text(
          name,
          style: TextStyle(
              color: listInterrestCheckSelected[index]
                  ? Appstore.colorWhite
                  : Appstore.colorDark1,
              fontWeight: FontWeight.w500,
              fontFamily: Appstore.appFont,
              fontSize: 15),
        ),
      ),
    );
  }

  Widget listInterrestWidget() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Interrests",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[0], index: 0),
                      interestButton(name: listInterestName[1], index: 1),
                      interestButton(name: listInterestName[2], index: 2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[3], index: 3),
                      interestButton(name: listInterestName[4], index: 4),
                      interestButton(name: listInterestName[5], index: 4),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[6], index: 5),
                      interestButton(name: listInterestName[7], index: 6),
                      interestButton(name: listInterestName[8], index: 7),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[9], index: 8),
                      interestButton(name: listInterestName[10], index: 9),
                      interestButton(name: listInterestName[11], index: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[11], index: 11),
                      interestButton(name: listInterestName[12], index: 12),
                      interestButton(name: listInterestName[13], index: 13),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[12], index: 14),
                      interestButton(name: listInterestName[13], index: 15),
                      interestButton(name: listInterestName[14], index: 16),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[15], index: 17),
                      interestButton(name: listInterestName[16], index: 18),
                      interestButton(name: listInterestName[17], index: 19),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listInterestName[18], index: 20),
                      interestButton(name: listInterestName[19], index: 21),
                      interestButton(name: listInterestName[20], index: 22),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalTraits extends StatefulWidget {
  const PersonalTraits({super.key});

  @override
  State<PersonalTraits> createState() => _PersonalTraitsState();
}

class _PersonalTraitsState extends State<PersonalTraits> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchBar(),
        const SizedBox(
          height: 15,
        ),
        listInterrestWidget()
      ],
    );
  }

  List<String> listTraitsName = [
    "Honest",
    "Reliable",
    "Social",
    "Organized",
    "Energitic",
    "Fun",
    "Thoughtful",
    "Caring",
    "Calm",
    "Mature",
    "Innovative",
    "Nice",
    "Extroveted",
    "Jovial",
    "Generous",
    "Dramatic",
    "Easy Going",
    "Relaxed",
    "Introveted",
    "Creative",
    "Responsable",
    "Easy Going",
  ];

  List<bool> listInterrestCheckSelected = [];

  Widget interestButton({required String name, required int index}) {
    for (int i = 0; i < listTraitsName.length; i++) {
      listInterrestCheckSelected.add(false);
    }
    return Bounce(
      duration: const Duration(milliseconds: 180),
      onPressed: () {
        setState(() {
          listInterrestCheckSelected[index] =
              !listInterrestCheckSelected[index];
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: listInterrestCheckSelected[index]
                ? Appstore.colorPLighter
                : Appstore.colorDark3,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Text(
          name,
          style: TextStyle(
              color: listInterrestCheckSelected[index]
                  ? Appstore.colorWhite
                  : Appstore.colorDark1,
              fontWeight: FontWeight.w500,
              fontFamily: Appstore.appFont,
              fontSize: 15),
        ),
      ),
    );
  }

  Widget listInterrestWidget() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[0], index: 0),
                      interestButton(name: listTraitsName[1], index: 1),
                      interestButton(name: listTraitsName[2], index: 2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[3], index: 3),
                      interestButton(name: listTraitsName[4], index: 4),
                      interestButton(name: listTraitsName[5], index: 5),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[6], index: 6),
                      interestButton(name: listTraitsName[7], index: 7),
                      interestButton(name: listTraitsName[8], index: 8),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[9], index: 9),
                      interestButton(name: listTraitsName[10], index: 10),
                      interestButton(name: listTraitsName[11], index: 11),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[12], index: 11),
                      interestButton(name: listTraitsName[13], index: 12),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[14], index: 14),
                      interestButton(name: listTraitsName[15], index: 15),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[16], index: 16),
                      interestButton(name: listTraitsName[17], index: 17),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[18], index: 18),
                      interestButton(name: listTraitsName[19], index: 19),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      interestButton(name: listTraitsName[20], index: 20),
                      interestButton(name: listTraitsName[21], index: 21),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguagePreferences extends StatefulWidget {
  const LanguagePreferences({super.key});

  @override
  State<LanguagePreferences> createState() => _LanguagePreferencesState();
}

class _LanguagePreferencesState extends State<LanguagePreferences> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchBar(),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Language you speak",
          style: TextStyle(
              color: Appstore.colorDark1,
              fontSize: 15,
              fontFamily: Appstore.appFont,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        listLang()
      ],
    );
  }

  List<bool> langStatus = [false, false, false, false, false, false];

  Widget listLang() {
    return Column(
      children: [
        listLangWidget(langName: "English", index: 0),
        listLangWidget(langName: "Arabic", index: 1),
        listLangWidget(langName: "Chinesse", index: 2),
        listLangWidget(langName: "Haousa", index: 3),
        listLangWidget(langName: "German", index: 4),
        listLangWidget(langName: "French", index: 5),
      ],
    );
  }

  Widget listLangWidget({required String langName, required int index}) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                color: Appstore.colorDark3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        langName,
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontFamily: Appstore.appFont,
                            fontSize: 15),
                      ),
                      Checkbox(
                          activeColor: Appstore.colorPLighter,
                          value: langStatus[index],
                          onChanged: (chg) {
                            setState(() {
                              langStatus[index] = !langStatus[index];
                            });
                          })
                    ],
                  ),
                ),
              )
            ])));
  }
}
