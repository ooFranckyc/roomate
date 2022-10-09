import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';

class RoomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isEnabled;
  final bool withIconButton;
  final IconData? icon;
  final bool obscureText;
  final VoidCallback functionIcon;
  const RoomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.isEnabled,
    required this.withIconButton,
    required this.functionIcon,
    required this.obscureText,
    this.icon,
    
  });

  @override
  State<RoomTextFormField> createState() => _RoomTextFormFieldState();
}

class _RoomTextFormFieldState extends State<RoomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        padding: const EdgeInsets.all(.70),
        decoration: BoxDecoration(
            color: const Color(0xffFBFBFB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: const Color(0xffEEEEEE))),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  controller: widget.controller,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: Appstore.appFont,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none),
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText,
                ),
              ),
            ),
            widget.withIconButton
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: widget.functionIcon,
                      child: Icon(
                        widget.icon,
                        color: Appstore.colorDark1,
                      ),
                    ))
                : const Padding(padding: EdgeInsets.zero)
          ],
        ));
  }
}

class RoomTextFormFieldMultiline extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const RoomTextFormFieldMultiline(
      {super.key, required this.controller, required this.hintText});

  @override
  State<RoomTextFormFieldMultiline> createState() =>
      _RoomTextFormFieldMultilineState();
}

class _RoomTextFormFieldMultilineState
    extends State<RoomTextFormFieldMultiline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          border: Border.all(width: 1, color: Appstore.colorDark2),
          borderRadius: BorderRadius.circular(10)),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: TextFormField(
            controller: widget.controller,
            maxLines: 3,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: Appstore.appFont,
                ),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
          ),
        ),
      ),
    );
  }
}

class CTextField extends StatefulWidget {
  final String title;
  final RoomTextFormField roomTextFormField;
  final bool? obscureText;
  const CTextField(
      {super.key,
      required this.title,
      required this.roomTextFormField,
      this.obscureText});

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 15,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: widget.roomTextFormField)
          ],
        ),
      ),
    );
  }
}
