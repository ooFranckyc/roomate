import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';

class MessageChatingLayout extends StatefulWidget {
  final bool hasReaded;
  final int missingMessage;
  final String username;
  final String handleMessage;
  final String time;
  const MessageChatingLayout(
      {super.key,
      required this.hasReaded,
      required this.missingMessage,
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
            context, SlideTransitionRightToLeft(const MessageScreen()));
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                            color: Appstore.colorDark1.withOpacity(.80),
                            fontFamily: Appstore.appFont,
                            fontSize: 17,
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
                        fontSize: 14,
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
                              color: Appstore.colorPLighter),
                          child: Text(
                            widget.missingMessage.toString(),
                            style: TextStyle(color: Appstore.colorWhite),
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
  final String username;
  final String handleMessage;
  final String tagIdCall;
  const MessageCallLayout(
      {super.key,
      required this.hasReaded,
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
            // profile
            Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200, shape: BoxShape.circle),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.80),
                          fontFamily: Appstore.appFont,
                          fontSize: 17,
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

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Column(),
    );
  }
}
