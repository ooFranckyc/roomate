import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/fragments/post/screens/roommate_screen.dart';
import 'package:roomate/screens/home/fragments/post/screens/rooms_screen.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';

class PostAdFragment extends StatefulWidget {
  const PostAdFragment({super.key});

  @override
  State<PostAdFragment> createState() => _PostAdFragmentState();
}

class _PostAdFragmentState extends State<PostAdFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 45,
          leading: Bounce(
            duration: const Duration(milliseconds: 180),
            onPressed: () {
              //
            },
            child: Container(
              width: 15,
              height: 15,
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
          title: Text(
            "Post Ad",
            style: TextStyle(
                color: Appstore.colorDark1,
                fontSize: 20,
                fontFamily: Appstore.appFont,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Appstore.colorWhite,
          elevation: 0,
        ),
        backgroundColor: Appstore.colorWhite,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "What would you like to post?",
                  style: TextStyle(
                      color: Appstore.colorDark1.withOpacity(.80),
                      fontSize: 20,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SlideTransitionRightToLeft(const RoomScreen()));
                      },
                      child: layoutPost(
                          title: "Room", icon: CupertinoIcons.car_detailed),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SlideTransitionRightToLeft(const RoommateScreen()));
                      },
                      child: layoutPost(
                          title: "Roommate", icon: CupertinoIcons.person_2),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget layoutPost({required String title, required IconData icon}) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          border: Border.all(width: 2, color: const Color(0xffEEEEEE)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Appstore.colorPLighter,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                    color: Appstore.colorDark1,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Appstore.colorDark1,
          ),
        ],
      ),
    );
  }
}
