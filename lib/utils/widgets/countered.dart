//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

// ignore: must_be_immutable
class CountedWidget extends StatefulWidget {
  final String title;
  late int countBegin;
  late int countLimit;
  CountedWidget(
      {super.key,
      required this.title,
      required this.countBegin,
      required this.countLimit});

  @override
  State<CountedWidget> createState() => _CountedWidgetState();
}

class _CountedWidgetState extends State<CountedWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: Appstore.colorDark1,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      widget.countBegin--;
                      if (widget.countBegin == 0) {
                        widget.countBegin = 0;
                      }
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 1, color: Appstore.colorDark2)),
                    child: Text(
                      "-",
                      style: TextStyle(
                          color: Appstore.colorDark2,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.countBegin.toString(),
                  style: TextStyle(
                      color: Appstore.colorDark2,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    setState(() {
                      widget.countBegin++;
                      if (widget.countBegin == widget.countLimit) {
                        widget.countBegin = widget.countLimit;
                        //log("not increment value > in counted limit");
                      }
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1, color: Appstore.colorPLighter)),
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: Appstore.colorPLighter,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
