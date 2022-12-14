import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/home/fragments/message/message_layout.dart';
import 'package:roomate/utils/appstore.dart';

class MessageFragment extends StatefulWidget {
  const MessageFragment({super.key});

  @override
  State<MessageFragment> createState() => _MessageFragmentState();
}

class _MessageFragmentState extends State<MessageFragment>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  List<Widget> listPageFragment = const [ChatsFragment(), CallFragment()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: currentIndex,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Appstore.colorWhite,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Appstore.colorWhite,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Appstore.colorPLighter,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: Appstore.colorPLighter,
            elevation: 0,
            toolbarHeight: 40,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Appstore.colorWhite, shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.arrow_left,
                      color: Appstore.colorPLighter,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Messages",
                  style: TextStyle(
                      color: Appstore.colorWhite,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )
              ],
            ),
            actions: [
              Bounce(
                duration: const Duration(milliseconds: 180),
                onPressed: () {
                  // search media
                },
                child: Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appstore.colorWhite, shape: BoxShape.circle),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Appstore.colorPLighter,
                    size: 20,
                  ),
                ),
              ),
            ],
            bottom: TabBar(
                indicatorColor: Appstore.colorWhite,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Appstore.colorWhite,
                labelStyle: TextStyle(
                    color: Appstore.colorWhite,
                    fontSize: 15,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                    color: Appstore.colorWhite,
                    fontSize: 15,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: 'Chats.',
                    icon: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Appstore.colorSSubtle, shape: BoxShape.circle),
                      child: Text(
                        3.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.bold,
                            color: Appstore.colorDark1),
                      ),
                    ),
                  ),
                  const Tab(
                    text: 'Calls.',
                  ),
                ]),
          ),
          body: TabBarView(
            children: listPageFragment,
          ),
        ),
      ),
    );
  }
}

class ChatsFragment extends StatefulWidget {
  const ChatsFragment({super.key});

  @override
  State<ChatsFragment> createState() => _ChatsFragmentState();
}

class _ChatsFragmentState extends State<ChatsFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 20,
        ),
        MessageChatingLayout(
            hasReaded: true,
            missingMessage: 0,
            imgProfile: "https://images.pexels.com/photos/32976/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400",
            username: "Cheryl Brown",
            handleMessage: "What's the apartement like",
            time: "08:03PM"),
        MessageChatingLayout(
            hasReaded: false,
            missingMessage: 2,
            imgProfile: "https://images.pexels.com/photos/2955375/pexels-photo-2955375.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Jide Aderson",
            handleMessage: "I'll get back to you",
            time: "06:00PM"),
        MessageChatingLayout(
            hasReaded: false,
            missingMessage: 0,
            imgProfile: "https://images.pexels.com/photos/50855/pexels-photo-50855.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Victor Greg",
            handleMessage: "It's all good",
            time: "08:03PM"),
        MessageChatingLayout(
            hasReaded: true,
            missingMessage: 0,
            imgProfile: "https://images.pexels.com/photos/1181293/pexels-photo-1181293.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Ivana Bell",
            handleMessage: "I like this apartment",
            time: "05:23PM"),
        MessageChatingLayout(
            hasReaded: true,
            missingMessage: 0,
            imgProfile: "https://images.pexels.com/photos/756484/pexels-photo-756484.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Adam Ontario",
            handleMessage: "Wow, this apartment is cute",
            time: "02:53AM"),
      ],
    );
  }
}

class CallFragment extends StatefulWidget {
  const CallFragment({super.key});

  @override
  State<CallFragment> createState() => _CallFragmentState();
}

class _CallFragmentState extends State<CallFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 20,
        ),
        MessageCallLayout(
            hasReaded: true,
            imgProfile: "https://images.pexels.com/photos/32976/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400",
            username: "Cheryl Brown",
            handleMessage: "What's the apartement like",
            tagIdCall: "vocal"),
        MessageCallLayout(
            hasReaded: false,
            imgProfile: "https://images.pexels.com/photos/1181293/pexels-photo-1181293.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Ivana Bell",
            handleMessage: "I like this apartment",
            tagIdCall: "video"),
        MessageCallLayout(
            hasReaded: false,
            imgProfile: "https://images.pexels.com/photos/756484/pexels-photo-756484.jpeg?auto=compress&cs=tinysrgb&w=400",
            username: "Adam Ontario",
            handleMessage: "Wow, this apartment is cute",
            tagIdCall: "vocal"),
      ],
    );
  }
}
