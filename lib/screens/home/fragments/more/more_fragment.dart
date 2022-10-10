import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({super.key});

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  TextStyle titleStyle = TextStyle(
      color: Appstore.colorDark1.withOpacity(.80),
      fontFamily: Appstore.appFont,
      fontWeight: FontWeight.w500,
      fontSize: 17);
  TextStyle subtitleStyle = TextStyle(
      color: Appstore.colorDark2,
      fontFamily: Appstore.appFont,
      fontWeight: FontWeight.w500,
      fontSize: 14);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Appstore.colorWhite,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Appstore.colorWhite,
        elevation: 0,
      ),
      backgroundColor: Appstore.colorWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            headerMoreProfileView(),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "General Setting",
                style: titleStyle,
              ),
              subtitle: Text(
                "custom all design in one.",
                style: subtitleStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.device_phone_portrait,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "My Listing",
                style: titleStyle,
              ),
              subtitle: Text(
                "See your listing of lasted publishing...",
                style: subtitleStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.creditcard,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "Make paiement",
                style: titleStyle,
              ),
              subtitle: Text(
                "Make paiement with any contact, client",
                style: subtitleStyle,
              ),
              trailing: Transform.rotate(
                  angle: 110,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Appstore.colorDark1.withOpacity(.80),
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.creditcard,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "Report (Emergency)",
                style: titleStyle,
              ),
              subtitle: Text(
                "Tap to learn more",
                style: subtitleStyle,
              ),
              trailing: Transform.rotate(
                  angle: 110,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Appstore.colorDark1.withOpacity(.80),
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "Help",
                style: titleStyle,
              ),
              subtitle: Text(
                "If you have a question, tap here",
                style: subtitleStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.crisis_alert_sharp,
                size: 25,
                color: Appstore.colorDark1.withOpacity(.80),
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "FAQ",
                style: titleStyle,
              ),
              subtitle: Text(
                "learn question in FAQ",
                style: subtitleStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 25,
                color: Appstore.colorError,
              ),
              visualDensity: VisualDensity.compact,
              title: Text(
                "Log Out",
                style: TextStyle(
                    color: Appstore.colorError,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget headerMoreProfileView() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('ressources/images/user.png')),
                      color: Appstore.colorDark3,
                      shape: BoxShape.circle),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Franck Mekoulou",
                          style: TextStyle(
                              color: Appstore.colorDark1,
                              fontFamily: Appstore.appFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Student",
                          style: TextStyle(
                              color: Appstore.colorDark2,
                              fontFamily: Appstore.appFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "20years, Out",
                          style: TextStyle(
                              color: Appstore.colorDark2,
                              fontFamily: Appstore.appFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        // edit profile button.
                        Bounce(
                          duration: const Duration(milliseconds: 180),
                          onPressed: () {
                            // Todo: by your! make your design.
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        Appstore.colorDark1.withOpacity(.80)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: Appstore.colorDark2,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Edit Profile.",
                                  style: TextStyle(
                                      fontFamily: Appstore.appFont,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // separator
            Divider(
              color: Appstore.colorDark3,
              height: 2,
              thickness: 2,
            )
          ],
        ));
  }
}
