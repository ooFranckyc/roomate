import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({super.key});

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Align(
            child: Text(
          "More Fragment",
          style: TextStyle(
              color: Appstore.colorDark1,
              fontFamily: Appstore.appFont,
              fontSize: 20),
        )),
    );
  }
}
