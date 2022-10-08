import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class PrimaryButton extends StatefulWidget {
  final Color color;
  final String text;
  final double width;
  final double margin;
  const PrimaryButton(
      {super.key,
      required this.color,
      required this.text,
      required this.width,
      required this.margin});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height: 55,
      margin: EdgeInsets.symmetric(
          horizontal: widget.margin == Appstore.debugValueDefault
              ? Appstore.defaultMarginButton
              : widget.margin),
      width: widget.width == Appstore.debugValueDefault
          ? double.infinity
          : widget.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        widget.text,
        style: TextStyle(
            color: Appstore.colorWhite,
            fontFamily: Appstore.appFont,
            fontSize: Appstore.fontSizeHeading3,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
