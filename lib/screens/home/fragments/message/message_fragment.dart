import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class MessageFragment extends StatefulWidget {
  const MessageFragment({super.key});

  @override
  State<MessageFragment> createState() => _MessageFragmentState();
}

class _MessageFragmentState extends State<MessageFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Align(
          child: Text(
        "Message Fragment",
        style: TextStyle(
            color: Appstore.colorDark1,
            fontFamily: Appstore.appFont,
            fontSize: 20),
      )),
    );
  }
}
