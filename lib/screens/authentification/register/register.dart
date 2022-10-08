import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/authentification/login/login.dart';
import 'package:roomate/screens/authentification/phone_number/phone_number.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';
import 'package:roomate/utils/widgets/or.dart';
import 'package:roomate/utils/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullnameEditController = TextEditingController();
  TextEditingController mailAddressEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();
  TextEditingController confirmPasswordEditController = TextEditingController();

  bool pwdChk = true;
  bool confirmPwdChk = true;

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
                    exit(1);
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
                      Text("Sign Up",
                          style: TextStyle(
                              color: Appstore.colorDark1,
                              fontSize: Appstore.fontSizeHeading1,
                              fontFamily: Appstore.appFont,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("Please create an account to continue",
                          style: TextStyle(
                              color: Appstore.colorDark2,
                              fontFamily: Appstore.appFont,
                              fontSize: Appstore.fontSizeHeading4,
                              fontWeight: FontWeight.w500)),
                      userFormRegister(),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                color: Appstore.colorDark1,
                              fontFamily: Appstore.appFont,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          Bounce(
                            duration: const Duration(milliseconds: 180),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  SlideTransitionRightToLeft(const LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Appstore.colorPLighter,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Appstore.appFont,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      // sign up button
                      Bounce(
                        duration: const Duration(milliseconds: 180),
                        onPressed: () {
                          // authentificate user
                          Navigator.push(
                              context,
                              SlideTransitionRightToLeft(
                                  const PhoneNumberScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: PrimaryButton(
                              color: Appstore.colorPLighter,
                              text: "Sign Up",
                              
                              width: Appstore.debugValueDefault,
                              margin: Appstore.defaultMarginButton),
                        ),
                      ),
                      // or widget
                      const OrSeparator(),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(Appstore.googleIcon,
                                    width: 35, height: 35),
                                Icon(
                                  Icons.facebook,
                                  color: Colors.blue.shade700,
                                  size: 35,
                                ),
                                Image.asset(Appstore.appleIcon,
                                    width: 35, height: 35),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // user sign up form
  Widget userFormRegister() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // fullname
          CTextField(title: "Full Name", roomTextFormField: RoomTextFormField(
            controller: fullnameEditController,
            hintText: "Enter your name", 
            keyboardType: TextInputType.name, 
            isEnabled: true, 
            withIconButton: false, 
            functionIcon: () {},
            obscureText: false,)),
          // email address
          CTextField(title: "Email", roomTextFormField: RoomTextFormField(
            controller: fullnameEditController,
            hintText: "Enter your email", 
            keyboardType: TextInputType.emailAddress, 
            isEnabled: true, 
            withIconButton: false, 
            functionIcon: () {},obscureText: false,)),
          // Password
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Appstore.colorDark1,
                        fontSize: 14,
                        fontFamily: Appstore.appFont,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 13),
                  Container(
                      padding: const EdgeInsets.all(.70),
                      margin: const EdgeInsets.only(left: 5),
                      height: 55,
                      decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xffEEEEEE))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                maxLines: 1,
                                controller: passwordEditController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    hintText: "Enter a password",
                                    hintStyle: TextStyle(fontSize: 14, fontFamily: Appstore.appFont,),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: pwdChk,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Bounce(
                                duration: const Duration(milliseconds: 180),
                                onPressed: () {
                                  setState(() {
                                    pwdChk = !pwdChk;
                                  });
                                },
                                child: Icon(
                                  pwdChk
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Appstore.colorDark2,
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
          // confirm Password
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm password",
                    style: TextStyle(
                        color: Appstore.colorDark1,
                        fontSize: 14,
                        fontFamily: Appstore.appFont,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 13),
                  Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 55,
                      decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xffEEEEEE))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                maxLines: 1,
                                controller: confirmPasswordEditController,
                                textAlign: TextAlign.start,
                                decoration:  InputDecoration(
                                    hintText: "Confirm a password",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: Appstore.appFont,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: confirmPwdChk,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Bounce(
                                duration: const Duration(milliseconds: 180),
                                onPressed: () {
                                  setState(() {
                                    confirmPwdChk = !confirmPwdChk;
                                  });
                                },
                                child: Icon(
                                  confirmPwdChk
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Appstore.colorDark2,
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
