import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
               Navigator.pop(context);
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
              "Notifications",
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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "This includes all apartment notifications",
                    style: TextStyle(
                        color: Appstore.colorDark1.withOpacity(.80),
                        fontSize: 18,
                        fontFamily: Appstore.appFont,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                ]),
          ),
          Expanded(child: listPushedNotif())
        ],
      ),
    );
  }

  Widget listPushedNotif() {
    return Column(
      children: const [
        NotificationLayout(
            icon: Icons.fireplace,
            title: "Fire Outlbook!!",
            description: "Overlay outlbook is done",
            time: "10:19PM",
            isCritical: true),
        NotificationLayout(
            icon: Icons.adjust_rounded,
            title: "Robbery!!",
            description: "Just commercial is ok",
            time: "10:19PM",
            isCritical: true),
        NotificationLayout(
            icon: Icons.adb_sharp,
            title: "Exploitation!!",
            description: "Changing implementation\n few employe",
            time: "10:19PM",
            isCritical: true),
      ],
    );
  }
}

class NotificationLayout extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool isCritical;
  const NotificationLayout(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.time,
      required this.isCritical});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appstore.colorPLighter, shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: Appstore.colorWhite,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.80),
                          fontSize: 16,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Appstore.colorDark2,
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      color: Appstore.colorDark2,
                      fontFamily: Appstore.appFont,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 3),
                Icon(
                  Icons.crisis_alert,
                  color:
                      isCritical ? Appstore.colorError : Appstore.colorSuccess,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
