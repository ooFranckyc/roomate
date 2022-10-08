import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:pinput/pinput.dart';
import 'package:roomate/screens/build_profile/build_profile.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final formKeyPIN = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: SingleChildScrollView(
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
                  width: 43,
                  height: 43,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appstore.colorPLighter, shape: BoxShape.circle),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Appstore.colorWhite,
                    size: 23,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Verify You Number",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: Appstore.fontSizeHeading1,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                          "Please enter the verification that was sent to your phone number",
                          style: TextStyle(
                              color: Appstore.colorDark2,
                              fontSize: 15,
                              fontFamily: Appstore.appFont,
                              fontWeight: FontWeight.w500)),
                    ),
                    // verify number insider
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter code",
                              style: TextStyle(
                                  color: Appstore.colorDark1,
                                  fontSize: 15,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 9),
                            Align(
                              alignment: Alignment.center,
                              child: Form(
                                key: formKeyPIN,
                                child: Pinput(
                                  length: 4,
                                  animationCurve:
                                      Curves.easeInOutCubicEmphasized,
                                  autofocus: true,
                                  focusedPinTheme: PinTheme(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: Appstore.colorPLighter))),
                                  defaultPinTheme: PinTheme(
                                      height: 60,
                                      width: 60,
                                      textStyle: TextStyle(
                                          color: Appstore.colorDark1,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      decoration: BoxDecoration(
                                          color: Appstore.colorWhite,
                                          border: Border.all(
                                              width: 1,
                                              color: Appstore.colorDark1),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  // Without Validator
                                  // If true error state will be applied no matter what validator returns
                                  forceErrorState: true,

                                  /// ------------
                                  /// With Validator
                                  /// Auto validate after user tap on keyboard done button, or completes Pinput
                                  pinputAutovalidateMode:
                                      PinputAutovalidateMode.onSubmit,
                                  validator: (pin) {
                                    if (pin == '2224') return null;
                                    return null;

                                    /// Text will be displayed under the Pinput
                                    //return 'Pin is incorrect';
                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Appstore.colorWhite,
                                        content: Text(
                                          "New code resent with successffully\nPlease Wait...",
                                          style: TextStyle(
                                              color: Appstore.colorDark1,
                                              fontSize: 15,
                                              fontFamily: Appstore.appFont,
                                              fontWeight: FontWeight.bold),
                                        )));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Resent code",
                                    style: TextStyle(
                                        color: Appstore.colorPLighter,
                                        fontFamily: Appstore.appFont,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            // Get OTP button
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 35),
                              child: Bounce(
                                duration: const Duration(milliseconds: 180),
                                onPressed: () {
                                  // send otp infos in the current device
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BuildProfileScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 35),
                                  child: PrimaryButton(
                                      color: Appstore.colorPLighter,
                                      text: "Verify",
                                      width: Appstore.debugValueDefault,
                                      margin: Appstore.defaultMarginButton),
                                ),
                              ),
                            ),
                          ],
                        ),
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
