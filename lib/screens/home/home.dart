import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/fragments/home/home_fragment.dart';
import 'package:roomate/screens/home/fragments/message/message_fragment.dart';
import 'package:roomate/screens/home/fragments/more/more_fragment.dart';
import 'package:roomate/screens/home/fragments/post/post_ad_fragment.dart';
import 'package:roomate/screens/home/fragments/save/save_fragment.dart';
import 'package:roomate/utils/appstore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> fragmentListPage = const [
    HomeFragment(),
    SavedFragment(),
    PostAdFragment(),
    MessageFragment(),
    MoreFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: fragmentListPage[currentIndex],
      bottomNavigationBar: Container(
        height: 65,
        color: const Color(0xffE5E5E5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // home
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    // bar
                    Container(
                      width: currentIndex == 0 ? 80 : 60,
                      height: 4,
                      color: currentIndex == 0
                          ? Appstore.colorPDarker
                          : Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.home,
                            size: 27,
                            color: currentIndex == 0
                                ? Appstore.colorPDarker
                                : Appstore.colorDark1.withOpacity(.80),
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex == 0
                                    ? Appstore.colorPDarker
                                    : Appstore.colorDark1,
                                fontWeight: currentIndex == 0
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontFamily: Appstore.appFont),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // favorite
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    // bar
                    Container(
                      width: currentIndex == 1 ? 80 : 60,
                      height: 4,
                      color: currentIndex == 1
                          ? Appstore.colorPDarker
                          : Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            size: 27,
                            color: currentIndex == 1
                                ? Appstore.colorPDarker
                                : Appstore.colorDark1.withOpacity(.80),
                          ),
                          Text(
                            "Saved",
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex == 1
                                    ? Appstore.colorPDarker
                                    : Appstore.colorDark1,
                                fontWeight: currentIndex == 1
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontFamily: Appstore.appFont),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // post ad
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    // bar
                    Container(
                      width: currentIndex == 2 ? 80 : 60,
                      height: 4,
                      color: currentIndex == 2
                          ? Appstore.colorPDarker
                          : Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.doc,
                            size: 27,
                            color: currentIndex == 2
                                ? Appstore.colorPDarker
                                : Appstore.colorDark1.withOpacity(.80),
                          ),
                          Text(
                            "Post Ad",
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex == 2
                                    ? Appstore.colorPDarker
                                    : Appstore.colorDark1,
                                fontWeight: currentIndex == 2
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontFamily: Appstore.appFont),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // post ad
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    // bar
                    Container(
                      width: currentIndex == 3 ? 80 : 60,
                      height: 4,
                      color: currentIndex == 3
                          ? Appstore.colorPDarker
                          : Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.bubble_left,
                            size: 27,
                            color: currentIndex == 3
                                ? Appstore.colorPDarker
                                : Appstore.colorDark1.withOpacity(.80),
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex == 3
                                    ? Appstore.colorPDarker
                                    : Appstore.colorDark1,
                                fontWeight: currentIndex == 3
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontFamily: Appstore.appFont),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // post ad
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  children: [
                    // bar
                    Container(
                      width: currentIndex == 4 ? 80 : 30,
                      height: 4,
                      color: currentIndex == 4
                          ? Appstore.colorPDarker
                          : Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Icon(
                            Icons.dashboard_rounded,
                            size: 27,
                            color: currentIndex == 4
                                ? Appstore.colorPDarker
                                : Appstore.colorDark1.withOpacity(.80),
                          ),
                          Text(
                            "More",
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex == 4
                                    ? Appstore.colorPDarker
                                    : Appstore.colorDark1,
                                fontWeight: currentIndex == 4
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontFamily: Appstore.appFont),
                          )
                        ],
                      ),
                    )
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
