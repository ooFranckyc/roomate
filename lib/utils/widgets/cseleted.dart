// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

Widget cSelectedWidget(
    {required List<String> listChildText,
    required List<VoidCallback> listChildCallback,
    required int counted, required int currentIndex}) {
  return SizedBox(
    child: Row(
      children: [
        for (counted = 0; counted < listChildText.length; counted++)
          Bounce(
            duration: const Duration(milliseconds: 180),
            onPressed: listChildCallback[counted],
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: listChildText[counted] == 0 // value?
                      ? Appstore.colorPLighter
                      : Appstore.colorDark3,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                listChildText[counted],
                style: TextStyle(
                    color: counted == listChildText[counted]
                        ? Appstore.colorWhite
                        : Appstore.colorDark1,
                    fontWeight: FontWeight.w500,
                    fontFamily: Appstore.appFont,
                    fontSize: 16),
              ),
            ),
          ),
      ],
    ),
  );
}
