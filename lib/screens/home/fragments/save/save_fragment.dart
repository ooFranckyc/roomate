import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class SavedFragment extends StatefulWidget {
  const SavedFragment({super.key});

  @override
  State<SavedFragment> createState() => _SavedFragmentState();
}

class _SavedFragmentState extends State<SavedFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Align(
          child: Text(
        "Saved Fragment",
        style: TextStyle(
            color: Appstore.colorDark1,
            fontFamily: Appstore.appFont,
            fontSize: 28),
      )),
    );
  }
}
