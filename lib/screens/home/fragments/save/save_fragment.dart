import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/fragments/home/widgets/profile_card_r.dart';
import 'package:roomate/utils/appstore.dart';

class SavedFragment extends StatefulWidget {
  const SavedFragment({super.key});

  @override
  State<SavedFragment> createState() => _SavedFragmentState();
}

class _SavedFragmentState extends State<SavedFragment> {
  int currentIndex = 0;
  List<Widget> fragmentPage = const [
    RoomSavedFragment(),
    RoommateSavedFragment()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Row(
            children: [
              Bounce(
                duration: const Duration(milliseconds: 180),
                onPressed: () {
                  // .pop(context)
                },
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(left: 5, right: 5),
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
              const SizedBox(height: 5),
              Text(
                "Saved",
                style: TextStyle(
                    color: Appstore.colorPLighter,
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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? Appstore.colorPLighter
                                : Appstore.colorDark3,
                            borderRadius: BorderRadius.circular(25)),
                        alignment: Alignment.center,
                        child: Text(
                          "Room",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Appstore.colorWhite
                                  : Appstore.colorDark1,
                              fontSize: 17,
                              fontWeight: currentIndex == 0
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              fontFamily: Appstore.appFont),
                        ),
                      ),
                    )),
                    const SizedBox(width: 5),
                    Expanded(
                        child: Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? Appstore.colorPLighter
                                : Appstore.colorDark3,
                            borderRadius: BorderRadius.circular(25)),
                        alignment: Alignment.center,
                        child: Text(
                          "Roommate ",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? Appstore.colorWhite
                                  : Appstore.colorDark1,
                              fontSize: 17,
                              fontWeight: currentIndex == 1
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              fontFamily: Appstore.appFont),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            //
            Expanded(child: fragmentPage[currentIndex])
          ],
        ));
  }
}

class RoomSavedFragment extends StatefulWidget {
  const RoomSavedFragment({super.key});

  @override
  State<RoomSavedFragment> createState() => _RoomSavedFragmentState();
}

class _RoomSavedFragmentState extends State<RoomSavedFragment> {
  // change this view
  bool isSeletec = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
                color: Appstore.colorWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Appstore.colorDark2.withOpacity(.40),
                      spreadRadius: 5,
                      blurRadius: 5)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // background image
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Appstore.colorDark3,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=400")),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Appstore.colorPSubtle.withOpacity(.60),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        child: Text(
                          "Avaible",
                          style: TextStyle(
                              color: Appstore.colorDark1,
                              fontSize: 14,
                              fontFamily: Appstore.appFont,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          setState(() {
                            isSeletec = !isSeletec;
                          });
                        },
                        child: isSeletec
                            ? Icon(
                                CupertinoIcons.heart_fill,
                                color: Appstore.colorPLighter,
                                size: 30,
                              )
                            : Icon(
                                CupertinoIcons.heart,
                                color: Appstore.colorPLighter,
                                size: 30,
                              ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1 Funished Room, Lagos",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: 18,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "1 Bedroom, 3 Person, 1 Toilet",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.w600,
                                  color: Appstore.colorSLighter),
                            ),
                            Text(
                              "Ront",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Appstore.appFont,
                                  color: Appstore.colorDark1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "TV, WIFI, AC",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Appstore.appFont,
                                  color: Appstore.colorDark1.withOpacity(.80),
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "N10.000",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: Appstore.appFont,
                                      color: Appstore.colorDark1),
                                ),
                                Text(
                                  "/Month",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: Appstore.appFont,
                                      color: Appstore.colorSLighter),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoommateSavedFragment extends StatefulWidget {
  const RoommateSavedFragment({super.key});

  @override
  State<RoommateSavedFragment> createState() => _RoommateSavedFragmentState();
}

class _RoommateSavedFragmentState extends State<RoommateSavedFragment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // one
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: ProfileCardRoommate(
                    img:
                        "https://images.pexels.com/photos/1181391/pexels-photo-1181391.jpeg?auto=compress&cs=tinysrgb&w=600",
                    roommateName: "Adam German",
                    roommateYear: 36,
                    roommateCountry: "Cameroon",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 20.220),
              ),
              Expanded(
                child: ProfileCardRoommate(
                    img:
                        "https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
                    roommateName: "Martin Dubois",
                    roommateYear: 20,
                    roommateCountry: "France",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 18.340),
              ),
            ],
          ),
          // two
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: ProfileCardRoommate(
                    img:
                        "https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&w=400",
                    roommateName: "Justina Belge",
                    roommateYear: 36,
                    roommateCountry: "Cameroon",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 23.220),
              ),
              Expanded(
                child: ProfileCardRoommate(
                    img:
                        "https://images.pexels.com/photos/1485031/pexels-photo-1485031.jpeg?auto=compress&cs=tinysrgb&w=400",
                    roommateName: "Daniela Bundy",
                    roommateYear: 20,
                    roommateCountry: "France",
                    roommateSex: "Female",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 18.340),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
