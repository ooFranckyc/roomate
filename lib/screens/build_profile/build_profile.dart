import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/complete_bp/complete_bp.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/cseleted.dart';
import 'package:roomate/utils/widgets/ct_stepper.dart';
import 'package:roomate/utils/widgets/text_field.dart';

class BuildProfileScreen extends StatefulWidget {
  const BuildProfileScreen({super.key});

  @override
  State<BuildProfileScreen> createState() => _BuildProfileScreenState();
}

class _BuildProfileScreenState extends State<BuildProfileScreen> {
  List<Widget> buildProfileAssembly = const [
    DetailsBuildProfile(),
    BalancyBuildProfile(),
    LocationBuildProfile(),
    FlagBuildProfile(),
  ];

  List<String> listAppbarTitle = const [
    "Enter your details",
    "Verify your account",
    "Set your location",
    "Image and bio",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 0),
          child: CustomStepper(
            listAppbarTitle: listAppbarTitle,
            listBuildBody: buildProfileAssembly,
            textOnFinished: 'Process to home page',
            textOnProcess: 'Next',
            targetWidgetOnFinished: const CompleteBuildProfile(),
          ),
        ),
      ),
    );
  }
}

class DetailsBuildProfile extends StatefulWidget {
  const DetailsBuildProfile({super.key});

  @override
  State<DetailsBuildProfile> createState() => _DetailsBuildProfileState();
}

class _DetailsBuildProfileState extends State<DetailsBuildProfile> {
  int currentIndex = 3;
  TextEditingController dateEditController = TextEditingController();
  TextEditingController fullnameEditController = TextEditingController();
  List<String> listTextChild = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    List<VoidCallback> call = [
      () {
        setState(() {
          currentIndex = 0;
          log("current index value ($currentIndex)");
        });
      },
      () {
        setState(() {
          currentIndex = 1;
          log("current index value ($currentIndex)");
        });
      },
      () {
        setState(() {
          currentIndex = 2;
          log("current index value ($currentIndex)");
        });
      }
    ];

    return Container(
      color: Appstore.colorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // full name
                        CTextField(
                            title: "Full name",
                            roomTextFormField: RoomTextFormField(
                              controller: fullnameEditController,
                              hintText: "Enter your name",
                              keyboardType: TextInputType.name,
                              isEnabled: true,
                              withIconButton: false,
                              functionIcon: () {},
                              obscureText: false,
                            )),
                        const SizedBox(height: 20),
                        // gender
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Appstore.colorDark1,
                                      fontSize: 15,
                                      fontFamily: Appstore.appFont,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    cSelectedWidget(
                                        listChildText: listTextChild,
                                        listChildCallback: call,
                                        counted: 3,
                                        currentIndex: currentIndex)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        // Date of beath
                        CTextField(
                            title: "Date of beath",
                            roomTextFormField: RoomTextFormField(
                              controller: dateEditController,
                              hintText: "Enter date of beath",
                              keyboardType: TextInputType.datetime,
                              isEnabled: true,
                              withIconButton: true,
                              functionIcon: () {},
                              icon: Icons.calendar_month,
                              obscureText: false,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BalancyBuildProfile extends StatefulWidget {
  const BalancyBuildProfile({super.key});

  @override
  State<BalancyBuildProfile> createState() => _BalancyBuildProfileState();
}

class _BalancyBuildProfileState extends State<BalancyBuildProfile> {
  TextEditingController countryEditController = TextEditingController();
  TextEditingController idSerialNumberEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Column(
          children: [
            // selected country
            CTextField(
                title: "Select country Proof",
                roomTextFormField: RoomTextFormField(
                  controller: countryEditController,
                  hintText: "Select your country",
                  keyboardType: TextInputType.multiline,
                  isEnabled: true,
                  withIconButton: true,
                  functionIcon: () {},
                  icon: Icons.keyboard_arrow_down,
                  obscureText: false,
                )),
            const SizedBox(height: 20),
            // user id number
            CTextField(
                title: "Enter Id Number",
                roomTextFormField: RoomTextFormField(
                  controller: idSerialNumberEditController,
                  hintText: "Write your id number",
                  keyboardType: TextInputType.number,
                  isEnabled: true,
                  withIconButton: false,
                  functionIcon: () {},
                  obscureText: false,
                )),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 160,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Appstore.colorSSubtle, boxShadow: [
                  BoxShadow(
                    color: Appstore.colorDark1.withOpacity(.30),
                    offset: const Offset(.10, .10),
                    spreadRadius: .30,
                    blurRadius: .30,
                  )
                ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_seal,
                      size: 35,
                      color: Appstore.colorDark1,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Find view this as g programs of \nverifiicating to \nfranckmekoulou@outlook.com\nsecurity and sleep awesome saild.",
                      style: TextStyle(
                          color: Appstore.colorDark1,
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationBuildProfile extends StatefulWidget {
  const LocationBuildProfile({super.key});

  @override
  State<LocationBuildProfile> createState() => _LocationBuildProfileState();
}

class _LocationBuildProfileState extends State<LocationBuildProfile> {
  TextEditingController locationEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Column(
          children: [
            CTextField(
                title: "Location",
                roomTextFormField: RoomTextFormField(
                  controller: locationEditController,
                  hintText: "Choose your location",
                  keyboardType: TextInputType.multiline,
                  isEnabled: true,
                  withIconButton: true,
                  functionIcon: () {},
                  icon: Icons.location_on,
                  obscureText: false,
                ))
          ],
        ),
      ),
    );
  }
}

class FlagBuildProfile extends StatefulWidget {
  const FlagBuildProfile({super.key});

  @override
  State<FlagBuildProfile> createState() => _FlagBuildProfileState();
}

class _FlagBuildProfileState extends State<FlagBuildProfile> {
  TextEditingController bioEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // elementary profile
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add your profile photo",
                    style: TextStyle(
                      color: Appstore.colorDark1,
                      fontSize: 18,
                      fontFamily: Appstore.appFont,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          // open camera
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 10, left: 4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff809BA0)),
                          child: Icon(
                            CupertinoIcons.camera_fill,
                            size: 23,
                            color: Appstore.colorWhite,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          // what you do, for user
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What Do You Currently do?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Appstore.colorDark1,
                    fontFamily: Appstore.appFont,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    // first option
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // job holder
                        currentDo(title: "Job Holder", index: 0),
                        const SizedBox(width: 10),
                        // user is student
                        currentDo(title: "Student", index: 1)
                      ],
                    ),
                    const SizedBox(height: 10),
                    // seconds option
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // no job
                        currentDo(title: "unemployed", index: 2),
                        const SizedBox(width: 10),
                        // other
                        currentDo(title: "Other", index: 3),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Add your bio",
                  style: TextStyle(
                    fontSize: 16,
                    color: Appstore.colorDark1,
                    fontFamily: Appstore.appFont,
                  ),
                ),
                const SizedBox(height: 5),
                // multiline text edit field
                RoomTextFormFieldMultiline(
                    controller: bioEditController,
                    hintText: "Tell us about your")
              ],
            ),
          )
        ],
      ),
    );
  }

  List<bool> currentStatus = [false, false, false, false];

  Widget currentDo({required String title, required int index}) {
    return Bounce(
      duration: const Duration(milliseconds: 180),
      onPressed: () {
        setState(() {
          currentStatus[index] = !currentStatus[index];
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: currentStatus[index]
                ? Appstore.colorPLighter
                : Appstore.colorDark3,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          title,
          style: TextStyle(
              color: currentStatus[index]
                  ? Appstore.colorWhite
                  : Appstore.colorDark1,
              fontSize: 14,
              fontFamily: Appstore.appFont,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
