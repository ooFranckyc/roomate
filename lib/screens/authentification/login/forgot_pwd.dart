import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';
import 'package:roomate/utils/widgets/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailResetPasswordEditController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Bounce(
                duration: const Duration(milliseconds: 180),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appstore.colorPLighter, shape: BoxShape.circle),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Appstore.colorWhite,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgot Password",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: Appstore.fontSizeHeading1,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                        "Enter you email address and would\nreceive on email with a new password",
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 15,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.w500)),
                    CTextField(
                        title: "Email Address",
                        roomTextFormField: RoomTextFormField(
                            controller: emailResetPasswordEditController,
                            hintText: "Enter your mail",
                            keyboardType: TextInputType.emailAddress,
                            isEnabled: true,
                            withIconButton: false,
                            functionIcon: () {},obscureText: false,)),
                    const SizedBox(height: 15),
                    // Reset password button
                    Bounce(
                      duration: const Duration(milliseconds: 180),
                      onPressed: () {
                        // Code
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: PrimaryButton(
                            color: Appstore.colorPLighter,
                            text: "Send",
                            width: Appstore.debugValueDefault,
                            margin: Appstore.defaultMarginButton),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
