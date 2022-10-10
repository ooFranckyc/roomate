import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';

class MessageChatingLayout extends StatefulWidget {
  final bool hasReaded;
  final int missingMessage;
  final String imgProfile;
  final String username;
  final String handleMessage;
  final String time;
  const MessageChatingLayout(
      {super.key,
      required this.hasReaded,
      required this.missingMessage,
      required this.imgProfile,
      required this.username,
      required this.handleMessage,
      required this.time});

  @override
  State<MessageChatingLayout> createState() => _MessageChatingLayoutState();
}

class _MessageChatingLayoutState extends State<MessageChatingLayout> {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 180),
      onPressed: () {
        Navigator.push(
            context,
            SlideTransitionRightToLeft(MessageScreen(
              imgProfile: widget.imgProfile,
              username: widget.username,
              isOnline: true,
            )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // profile
              Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.imgProfile)),
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                            color: Appstore.colorDark1.withOpacity(.75),
                            fontFamily: Appstore.appFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.hasReaded
                              ? Icon(
                                  Icons.done_all,
                                  color: Appstore.colorPLighter,
                                  size: 20,
                                )
                              : Container(),
                          const SizedBox(width: 5),
                          Text(
                            widget.handleMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Appstore.colorDark2,
                                fontFamily: Appstore.appFont,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(
                        color: Appstore.colorDark1.withOpacity(.70),
                        fontFamily: Appstore.appFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  widget.missingMessage > 0
                      ? Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.only(top: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Appstore.colorSSubtle),
                          child: Text(
                            widget.missingMessage.toString(),
                            style: TextStyle(
                                color: Appstore.colorDark1,
                                fontWeight: FontWeight.w500,
                                fontFamily: Appstore.appFont),
                          ),
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageCallLayout extends StatefulWidget {
  final bool hasReaded;
  final String imgProfile;
  final String username;
  final String handleMessage;
  final String tagIdCall;
  const MessageCallLayout(
      {super.key,
      required this.hasReaded,
      required this.imgProfile,
      required this.username,
      required this.handleMessage,
      required this.tagIdCall});

  @override
  State<MessageCallLayout> createState() => _MessageCallLayoutState();
}

class _MessageCallLayoutState extends State<MessageCallLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imgProfile)),
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.75),
                          fontFamily: Appstore.appFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.hasReaded
                            ? Icon(
                                Icons.done_all,
                                color: Appstore.colorPLighter,
                                size: 20,
                              )
                            : Container(),
                        const SizedBox(width: 5),
                        Text(
                          widget.handleMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Appstore.colorDark2,
                              fontFamily: Appstore.appFont,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            widget.tagIdCall == "vocal"
                ? Icon(
                    CupertinoIcons.phone,
                    color: Appstore.colorPLighter,
                    size: 25,
                  )
                : widget.tagIdCall == "video"
                    ? Icon(
                        CupertinoIcons.video_camera,
                        color: Appstore.colorPLighter,
                        size: 25,
                      )
                    : Container()
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MessageScreen extends StatefulWidget {
  late String imgProfile;
  late String username;
  final bool isOnline;
  MessageScreen(
      {super.key,
      required this.imgProfile,
      required this.username,
      required this.isOnline});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Appstore.colorPLighter,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Appstore.colorPLighter,
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
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imgProfile)),
                  shape: BoxShape.circle,
                  color: Appstore.colorWhite),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: TextStyle(
                      color: Appstore.colorWhite,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                Text(
                  widget.isOnline ? "Online" : "",
                  style: TextStyle(
                      color: Appstore.colorWhite,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
              ],
            ),
          ],
        ),
        actions: [
          Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                // call target contact with video mode
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  CupertinoIcons.video_camera,
                  size: 25,
                  color: Appstore.colorWhite.withOpacity(.80),
                ),
              )),
          Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                // call target contact with vocal mode
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  CupertinoIcons.phone,
                  size: 25,
                  color: Appstore.colorWhite.withOpacity(.80),
                ),
              )),
          Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                // more menu
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Appstore.colorWhite,
                ),
              )),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          staticChats(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 83,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 2,
                          color: Appstore.colorDark2.withOpacity(.70))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Type here...",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none),
                        )),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Bounce(
                              duration: const Duration(milliseconds: 180),
                              onPressed: () {
                                // pick any file from device...
                              },
                              child: Transform.rotate(
                                angle: 60,
                                child: Icon(
                                  Icons.attach_file_sharp,
                                  size: 25,
                                  color: Appstore.colorPLighter,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Bounce(
                              duration: const Duration(milliseconds: 180),
                              onPressed: () {
                                // pick image from gallery...
                              },
                              child: Icon(
                                Icons.image_outlined,
                                size: 25,
                                color: Appstore.colorPLighter,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Icon(
                Icons.mic,
                color: Appstore.colorPLighter,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget staticChats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          BuildingChatModel(
            isSender: true,
            message:
                "Hello, I'd like to make more enquired about to room you have avaible.",
            time: "6:00PM",
            gms: false,
          ),
          BuildingChatModel(
            isSender: false,
            message: "Sure.",
            time: "6:25PM",
            gms: true,
          ),
          BuildingChatModel(
            isSender: false,
            message: "Yeah, what would you like to know",
            time: "6:25PM",
            gms: false,
          ),
        ],
      ),
    );
  }
}

class BuildingChatModel extends StatefulWidget {
  final bool isSender; // is not is receive
  final String message;
  final String time;
  final bool gms;
  const BuildingChatModel(
      {super.key,
      required this.isSender,
      required this.message,
      required this.time,
      required this.gms});

  @override
  State<BuildingChatModel> createState() => _BuildingChatModelState();
}

class _BuildingChatModelState extends State<BuildingChatModel> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment:
            widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: widget.isSender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 + 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: widget.isSender
                      ? Appstore.colorPLighter
                      : const Color(0xffE5E7F6),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: Text(
                widget.message,
                maxLines: 5,
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.isSender
                        ? Appstore.colorWhite
                        : Appstore.colorDark1,
                    fontSize: 14,
                    fontFamily: Appstore.appFont,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.isSender
                    ? Icon(
                        Icons.done_all,
                        color: Appstore.colorPLighter,
                        size: 20,
                      )
                    : Container(),
                const SizedBox(width: 5),
                widget.gms
                    ? Container()
                    : Text(
                        widget.time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 14,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.w600),
                      )
              ],
            )
          ],
        ));
  }
}
