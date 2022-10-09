import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget {
  late bool isChecked;
  late String title;
  CustomRadioButton(
      {super.key, required this.isChecked, required this.title});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isChecked = !widget.isChecked;
          });
        },
        child: Row(
          children: [
            Bounce(
              duration: const Duration(milliseconds: 180),
              onPressed: () {
                setState(() {
                  widget.isChecked = !widget.isChecked;
                });
              },
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Appstore.colorDark2),
                    borderRadius: BorderRadius.circular(5)),
                child: widget.isChecked
                    ? Icon(
                        Icons.check,
                        size: 23,
                        color: Appstore.colorPLighter,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              widget.title,
              style: TextStyle(
                  color: Appstore.colorDark1.withOpacity(.80), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
