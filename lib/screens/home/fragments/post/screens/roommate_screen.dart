import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';

class RoommateScreen extends StatefulWidget {
  const RoommateScreen({super.key});

  @override
  State<RoommateScreen> createState() => _RoommateScreenState();
}

class _RoommateScreenState extends State<RoommateScreen> {
  int currentIndex = 3, currentIndexRelg = 4, currentIndexSt = 4;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Appstore.colorPLighter, shape: BoxShape.circle),
                child: Icon(
                  CupertinoIcons.arrow_left,
                  color: Appstore.colorWhite,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "Set your preferences",
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 20,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Appstore.colorWhite,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Appstore.colorWhite,
        elevation: 0,
      ),
      backgroundColor: Appstore.colorWhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Put yourself out there to improve your chances of getting a room",
                  style: TextStyle(
                      color: Appstore.colorDark1,
                      fontSize: 18,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // post live widget
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Where do you want to live?",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.80),
                          fontSize: 16,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.all(.70),
                      decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xffEEEEEE))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  maxLines: 1,
                                  //controller: cityStrEditController,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      hintText: "Type a city",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: Appstore.appFont,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: Appstore.colorDark1.withOpacity(.80),
                                size: 25,
                              )
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Who Would You Like To Stay With?",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.80),
                          fontSize: 15,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndex == 0
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                          color: currentIndex == 0
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndex == 1
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                          color: currentIndex == 1
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndex == 2
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Other",
                                      style: TextStyle(
                                          color: currentIndex == 2
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // religion
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Religion",
                              style: TextStyle(
                                  color: Appstore.colorDark1,
                                  fontSize: 15,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexRelg = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexRelg == 0
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Islam",
                                      style: TextStyle(
                                          color: currentIndexRelg == 0
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexRelg = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexRelg == 1
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Christianity",
                                      style: TextStyle(
                                          color: currentIndexRelg == 1
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexRelg = 2;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexRelg == 2
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Other",
                                      style: TextStyle(
                                          color: currentIndexRelg == 2
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // suitable for user
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Roommate Suitable For You?",
                              style: TextStyle(
                                  color: Appstore.colorDark1,
                                  fontSize: 15,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexSt = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexSt == 0
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Student",
                                      style: TextStyle(
                                          color: currentIndexSt == 0
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexSt = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexSt == 1
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Job Holder",
                                      style: TextStyle(
                                          color: currentIndexSt == 1
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Bounce(
                                  duration: const Duration(milliseconds: 180),
                                  onPressed: () {
                                    setState(() {
                                      currentIndexSt = 2;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: currentIndexSt == 2
                                            ? Appstore.colorPLighter
                                            : Appstore.colorDark3,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Text(
                                      "Any",
                                      style: TextStyle(
                                          color: currentIndexSt == 2
                                              ? Appstore.colorWhite
                                              : Appstore.colorDark1,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: Appstore.appFont,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // suitable for user
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What Kind Of Room Do You Prefer?",
                              style: TextStyle(
                                  color: Appstore.colorDark1,
                                  fontSize: 15,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            CheckboxListTile(
                                value: false,
                                title: Text(
                                  "Mini Apartment",
                                  style: TextStyle(
                                      color: Appstore.colorDark1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Appstore.appFont),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (vl) {}),
                            CheckboxListTile(
                                value: false,
                                title: Text(
                                  "Private Room",
                                  style: TextStyle(
                                      color: Appstore.colorDark1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Appstore.appFont),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (vl) {}),
                            CheckboxListTile(
                                value: false,
                                title: Text(
                                  "Shared Room",
                                  style: TextStyle(
                                      color: Appstore.colorDark1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Appstore.appFont),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (vl) {}),
                            CheckboxListTile(
                                value: false,
                                title: Text(
                                  "Any",
                                  style: TextStyle(
                                      color: Appstore.colorDark1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Appstore.appFont),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (vl) {}),
                          ],
                        ),
                      ),
                    ),
                    Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: () {
                        // post ad code
                        setState(() {
                          loading = true;
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Appstore.colorPLighter,
                                content: Text(
                                  "You has been shared with successffully",
                                  style: TextStyle(
                                      color: Appstore.colorWhite,
                                      fontFamily: Appstore.appFont,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )));
                          });
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: PrimaryButton(
                            color: Appstore.colorPLighter,
                            text: loading ? "Loading..." : "Post",
                            width: Appstore.debugValueDefault,
                            margin: Appstore.defaultMarginButton),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
