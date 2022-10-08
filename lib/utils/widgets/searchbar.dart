import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Appstore.colorDark3)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none),
                )),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    // run search code
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Appstore.colorPLighter, shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.search,
                      size: 25,
                      color: Appstore.colorWhite,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}


class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Appstore.colorDark3.withOpacity(.80),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 2, color: Appstore.colorDark3)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search by neighbourhood, street or city",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none),
                )),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    // run search code
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Appstore.colorPLighter, shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.search,
                      size: 25,
                      color: Appstore.colorWhite,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
