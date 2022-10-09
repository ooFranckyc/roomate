import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';

class CustomStepper extends StatefulWidget {
  final List<String> listAppbarTitle;
  final List<Widget> listBuildBody;
  final String textOnFinished;
  final String textOnProcess;
  final Widget targetWidgetOnFinished;
  const CustomStepper(
      {super.key,
      required this.listAppbarTitle,
      required this.listBuildBody,
      required this.textOnFinished,
      required this.textOnProcess,
      required this.targetWidgetOnFinished});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int cibp = 0; // please rename this variable.
  bool fakeLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          // todo:
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Appstore.colorPLighter,
                              shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.arrow_left,
                            color: Appstore.colorWhite,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        widget.listAppbarTitle[cibp],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: Appstore.appFont,
                            color: Appstore.colorDark1),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: cibp == 0
                                  ? Appstore.colorWhite
                                  : Colors.grey.shade300,
                              border: cibp == 0
                                  ? Border.all(
                                      width: 1, color: Appstore.colorPLighter)
                                  : null,
                              shape: BoxShape.circle),
                          child: Text(
                            1.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: Appstore.appFont,
                                color: cibp == 0
                                    ? Appstore.colorPLighter
                                    : Appstore.colorDark1),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: cibp == 1
                                    ? Appstore.colorWhite
                                    : Colors.grey.shade300,
                                border: cibp == 1
                                    ? Border.all(
                                        width: 1, color: Appstore.colorPLighter)
                                    : null,
                                shape: BoxShape.circle),
                            child: Text(2.toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: Appstore.appFont,
                                    fontWeight: FontWeight.bold,
                                    color: cibp == 1
                                        ? Appstore.colorPLighter
                                        : Appstore.colorDark1))),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: cibp == 2
                                    ? Appstore.colorWhite
                                    : Colors.grey.shade300,
                                border: cibp == 2
                                    ? Border.all(
                                        width: 1, color: Appstore.colorPLighter)
                                    : null,
                                shape: BoxShape.circle),
                            child: Text(
                              3.toString(),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.bold,
                                  color: cibp == 2
                                      ? Appstore.colorPLighter
                                      : Appstore.colorDark1),
                            )),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: cibp == 3
                                    ? Appstore.colorWhite
                                    : Colors.grey.shade300,
                                border: cibp == 3
                                    ? Border.all(
                                        width: 1, color: Appstore.colorPLighter)
                                    : null,
                                shape: BoxShape.circle),
                            child: Text(
                              4.toString(),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.bold,
                                  color: cibp == 3
                                      ? Appstore.colorPLighter
                                      : Appstore.colorDark1),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          widget.listBuildBody[cibp],
          cibp == 3
              ? Bounce(
                  duration: const Duration(milliseconds: 210),
                  onPressed: () {
                    // continue with user information
                    setState(() {
                      fakeLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      // wait a few minutes left, your should saved all data take from all last screen
                      // then push to home screen
                      Navigator.pushReplacement(
                          context,
                          SlideTransitionRightToLeft(
                              widget.targetWidgetOnFinished));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: PrimaryButton(
                        color: Appstore.colorPLighter,
                        text: fakeLoading
                            ? "Please wait..."
                            : widget.textOnFinished,
                        width: Appstore.debugValueDefault,
                        margin: Appstore.defaultMarginButton),
                  ),
                )
              : Bounce(
                  duration: const Duration(milliseconds: 180),
                  onPressed: () {
                    switch (cibp) {
                      case 0:
                        setState(() {
                          cibp = 1;
                        });
                        break;
                      case 1:
                        setState(() {
                          cibp = 2;
                        });
                        break;
                      case 2:
                        setState(() {
                          cibp = 3;
                        });
                        break;
                      default:
                    }
                    log(cibp.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 210),
                    child: PrimaryButton(
                        color: Appstore.colorPLighter,
                        text: widget.textOnProcess,
                        width: Appstore.debugValueDefault,
                        margin: Appstore.defaultMarginButton),
                  ),
                )
        ],
      ),
    );
  }
}
