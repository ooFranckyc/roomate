import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/home.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';
import 'package:roomate/utils/widgets/countered.dart';
import 'package:roomate/utils/widgets/cseleted.dart';
import 'package:roomate/utils/widgets/ct_stepper.dart';
import 'package:roomate/utils/widgets/radio.dart';
import 'package:roomate/utils/widgets/text_field.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  List<String> listAppbarTitle = [
    "Enter location",
    "Rent and availability",
    "Room Overview",
    "Image and bio"
  ];

  List<Widget> listBuildBody = const [
    LocationFragment(),
    RentAvaibalityPageFragment(),
    RoomOverviewPageFragment(),
    ImageAndBioPageFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appstore.colorWhite,
        body: SingleChildScrollView(
          child: CustomStepper(
            listAppbarTitle: listAppbarTitle,
            listBuildBody: listBuildBody,
            textOnFinished: 'Publish Listing',
            textOnProcess: 'Continue',
            targetWidgetOnFinished: const CongragListingScreen(),
          ),
        ),
      ),
    );
  }
}

class LocationFragment extends StatefulWidget {
  const LocationFragment({super.key});

  @override
  State<LocationFragment> createState() => _LocationFragmentState();
}

class _LocationFragmentState extends State<LocationFragment> {
  TextEditingController cityEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // city
            CTextField(
                title: "City",
                roomTextFormField: RoomTextFormField(
                    controller: cityEditController,
                    hintText: "Enter City",
                    keyboardType: TextInputType.name,
                    isEnabled: true,
                    withIconButton: false,
                    functionIcon: () {},
                    obscureText: false)),
            const SizedBox(height: 20),
            // user mail address
            CTextField(
                title: "Email address",
                roomTextFormField: RoomTextFormField(
                  controller: cityEditController,
                  hintText: "Enter Address",
                  keyboardType: TextInputType.name,
                  isEnabled: true,
                  withIconButton: true,
                  functionIcon: () {},
                  obscureText: false,
                  icon: Icons.location_on_outlined,
                )),
          ],
        ),
      ),
    );
  }
}

class RentAvaibalityPageFragment extends StatefulWidget {
  const RentAvaibalityPageFragment({super.key});

  @override
  State<RentAvaibalityPageFragment> createState() =>
      _RentAvaibalityPageFragmentState();
}

class _RentAvaibalityPageFragmentState
    extends State<RentAvaibalityPageFragment> {
  TextEditingController availabilityEditController = TextEditingController();
  //TextEditingController availabilityEditController = TextEditingController();
  //TextEditingController availabilityEditController = TextEditingController();

  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // user availability
            CTextField(
                title: "Set your availability",
                roomTextFormField: RoomTextFormField(
                  controller: availabilityEditController,
                  hintText: "Set a date",
                  keyboardType: TextInputType.datetime,
                  isEnabled: true,
                  withIconButton: true,
                  functionIcon: () {
                    // open native dart time picker
                  },
                  obscureText: false,
                  icon: Icons.calendar_month_outlined,
                )),
            const SizedBox(height: 10),
            CustomRadioButton(isChecked: false, title: "Intermediate"),
            const SizedBox(height: 15),
            // recent month?
            CTextField(
                title: "What's the rent per month?",
                roomTextFormField: RoomTextFormField(
                  controller: availabilityEditController,
                  hintText: "Type amount",
                  keyboardType: TextInputType.datetime,
                  isEnabled: true,
                  withIconButton: false,
                  functionIcon: () {},
                  obscureText: false,
                )),
            const SizedBox(height: 10),
            CustomRadioButton(isChecked: false, title: "Bill Included"),
            const SizedBox(height: 15),
            // deposit
            CTextField(
                title: "Deposit",
                roomTextFormField: RoomTextFormField(
                  controller: availabilityEditController,
                  hintText: "Add a deposite",
                  keyboardType: TextInputType.datetime,
                  isEnabled: true,
                  withIconButton: false,
                  functionIcon: () {},
                  obscureText: false,
                )),
            const SizedBox(height: 10),
            CustomRadioButton(isChecked: false, title: "No deposite required"),
          ],
        ),
      ),
    );
  }
}

class RoomOverviewPageFragment extends StatefulWidget {
  const RoomOverviewPageFragment({super.key});

  @override
  State<RoomOverviewPageFragment> createState() =>
      _RoomOverviewPageFragmentState();
}

class _RoomOverviewPageFragmentState extends State<RoomOverviewPageFragment> {
  List<String> listChildText = ["Full", "Semi", "None"];
  List<String> listChildText2 = ["Me only", "Family", "Couple"];
  List<VoidCallback> listChildCallback = [() {}, () {}, () {}];
  int currentIndex = 0;

  TextEditingController sqmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Appstore.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // list room type
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Room Type",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      CustomRadioButton(
                          isChecked: false, title: "Mini Apartment"),
                      const SizedBox(
                        height: 3,
                      ),
                      CustomRadioButton(
                          isChecked: false, title: "Private Room"),
                      const SizedBox(
                        height: 3,
                      ),
                      CustomRadioButton(isChecked: false, title: "Shared Room"),
                      const SizedBox(
                        height: 3,
                      ),
                      CustomRadioButton(isChecked: false, title: "Any"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // bar start
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Appstore.colorDark2,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 5),
                CountedWidget(
                    title: "Number of Bedroms", countBegin: 1, countLimit: 20),
                const SizedBox(height: 10),
                CountedWidget(
                    title: "Number of Toilets", countBegin: 1, countLimit: 20),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Appstore.colorDark2,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ), // bar end
                const SizedBox(height: 20),
                Text(
                  "Funishing",
                  style: TextStyle(
                      color: Appstore.colorDark1,
                      fontSize: 16,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                cSelectedWidget(
                    listChildText: listChildText,
                    listChildCallback: listChildCallback,
                    counted: 3,
                    currentIndex: currentIndex),
                const SizedBox(height: 20),
                CTextField(
                    title: "Proprety Size",
                    roomTextFormField: RoomTextFormField(
                        controller: sqmController,
                        hintText: "Sq.m",
                        keyboardType: TextInputType.number,
                        isEnabled: true,
                        withIconButton: false,
                        functionIcon: () {},
                        obscureText: false)),
                const SizedBox(
                  height: 10,
                ),
                CTextField(
                    title: "Room Size",
                    roomTextFormField: RoomTextFormField(
                        controller: sqmController,
                        hintText: "Sq.m",
                        keyboardType: TextInputType.number,
                        isEnabled: true,
                        withIconButton: false,
                        functionIcon: () {},
                        obscureText: false)),
                const SizedBox(height: 20),
                Text(
                  "Who Would You Like To Stav With?",
                  style: TextStyle(
                      color: Appstore.colorDark1,
                      fontSize: 16,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                cSelectedWidget(
                    listChildText: listChildText2,
                    listChildCallback: listChildCallback,
                    counted: 3,
                    currentIndex: currentIndex),
              ],
            ),
          ),
        ));
  }
}

class ImageAndBioPageFragment extends StatefulWidget {
  const ImageAndBioPageFragment({super.key});

  @override
  State<ImageAndBioPageFragment> createState() =>
      _ImageAndBioPageFragmentState();
}

class _ImageAndBioPageFragmentState extends State<ImageAndBioPageFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appstore.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Give a detailed description of the house.",
              style: TextStyle(
                  color: Appstore.colorDark2,
                  fontFamily: Appstore.appFont,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Add pictures of your room",
                  style: TextStyle(
                      color: Appstore.colorDark2,
                      fontFamily: Appstore.appFont,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF7F7F7),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(.20),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(.15, .15))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () async {
                          // open galery device then pic a selected picuture
                        },
                        child: Icon(
                          CupertinoIcons.camera,
                          color: Appstore.colorDark1.withOpacity(.80),
                          size: 60,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Click to browse gallery to\nupload a picture.",
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    " *You must upload at least three pictures",
                    style: TextStyle(
                        color: Appstore.colorDark2,
                        fontFamily: Appstore.appFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Add Video",
                  style: TextStyle(
                      color: Appstore.colorDark2,
                      fontFamily: Appstore.appFont,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF7F7F7),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(.20),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(.15, .15))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () async {
                          // open galery device then pic a selected video
                        },
                        child: Icon(
                          CupertinoIcons.videocam_circle,
                          color: Appstore.colorDark1.withOpacity(.80),
                          size: 60,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Click to browse gallery to\nupload a picture.",
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    " *You must upload at least three videos",
                    style: TextStyle(
                        color: Appstore.colorDark2,
                        fontFamily: Appstore.appFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CongragListingScreen extends StatefulWidget {
  const CongragListingScreen({super.key});

  @override
  State<CongragListingScreen> createState() => _CongragListingScreenState();
}

class _CongragListingScreenState extends State<CongragListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset(path, width: width, height: height),
            Text(
              "Congratulations",
              style: TextStyle(
                  color: Appstore.colorDark1.withOpacity(.80),
                  fontFamily: Appstore.appFont,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            Text(
              "You post has been  successfully uploaded. You can always go back to make changes. ",
              style: TextStyle(
                color: Appstore.colorDark1,
                fontSize: 15,
                fontFamily: Appstore.appFont,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Bounce(
                duration: const Duration(milliseconds: 180),
                onPressed: () {
                  Navigator.pushReplacement(context, SlideTransitionLeftToRight(const HomeScreen()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Appstore.colorPLighter,
                                content: Text(
                                  "We have take you command with successffully",
                                  style: TextStyle(
                                      color: Appstore.colorWhite,
                                      fontFamily: Appstore.appFont,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )));
                },
                child: PrimaryButton(
                    color: Appstore.colorPLighter,
                    text: "View Listing",
                    width: Appstore.debugValueDefault,
                    margin: Appstore.defaultMarginButton),
              ),
            )
          ],
        ),
      ),
    );
  }
}
