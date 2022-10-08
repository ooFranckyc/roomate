import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/authentification/phone_number/verify_code.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneNumberEditController = TextEditingController();

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
                    Text("Enter you phone number",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: Appstore.fontSizeHeading1,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text("You will receive a 4 digit code to verify next",
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 15,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.w500)),
                    // phone number insider
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter phone number",
                              style: TextStyle(
                                  color: Appstore.colorDark1,
                                  fontSize: 15,
                                  fontFamily: Appstore.appFont,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 55,
                              padding: const EdgeInsets.all(.70),
                              decoration: BoxDecoration(
                                  color: const Color(0xffFBFBFB),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xffEEEEEE))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: phoneNumberEditController,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      hintText: "+237",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: Appstore.appFont,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ),
                            const SizedBox(height: 80),
                            // Get OTP button
                            Bounce(
                              duration: const Duration(milliseconds: 180),
                              onPressed: () {
                                // send otp infos in the current device
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyCodeScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: PrimaryButton(
                                    color: Appstore.colorPLighter,
                                    text: "Send OTP",
                                    width: Appstore.debugValueDefault,
                                    margin: Appstore.defaultMarginButton),
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
