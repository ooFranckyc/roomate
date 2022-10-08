import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 1,
            color: Appstore.colorDark2,
          ),
          Text(
            " OR ",
            style: TextStyle(color: Appstore.colorDark1, fontSize: 14, fontFamily: Appstore.appFont,),
          ),
          Container(
            width: 110,
            height: 1,
            color: Appstore.colorDark2,
          ),
        ],
      ),
    );
  }
}