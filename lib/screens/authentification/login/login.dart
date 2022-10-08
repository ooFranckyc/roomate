import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:roomate/screens/authentification/login/forgot_pwd.dart';
import 'package:roomate/screens/build_profile/build_profile.dart';
import 'package:roomate/utils/animations/transition.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/button.dart';
import 'package:roomate/utils/widgets/or.dart';
import 'package:roomate/utils/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditController = TextEditingController();
  TextEditingController passwordlEditController = TextEditingController();
  bool isChecked = true;

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
                    Text("Welcome back!",
                        style: TextStyle(
                            color: Appstore.colorDark1,
                            fontSize: Appstore.fontSizeHeading1,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Sign in to continue",
                        style: TextStyle(
                            color: Appstore.colorDark2,
                            fontSize: 15,
                            fontFamily: Appstore.appFont,
                            fontWeight: FontWeight.w500)),
                    // email address insert
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CTextField(
                                title: "Email Address",
                                roomTextFormField: RoomTextFormField(
                                  controller: emailEditController,
                                  hintText: "Enter your mail",
                                  keyboardType: TextInputType.emailAddress,
                                  isEnabled: true,
                                  withIconButton: false,
                                  functionIcon: () {},
                                  obscureText: false,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            // password
                            CTextField(
                                title: "Password",
                                roomTextFormField: RoomTextFormField(
                                    controller: passwordlEditController,
                                    hintText: "Enter a password",
                                    keyboardType: TextInputType.visiblePassword,
                                    isEnabled: true,
                                    withIconButton: false,
                                    functionIcon: () {

                                    },
                                    obscureText: true)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 198,
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: isChecked,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (onChanged) {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    activeColor: Appstore.colorPLighter,
                                    dense: true,
                                    tristate: false,
                                    visualDensity: VisualDensity.comfortable,
                                    title: Text(
                                      "Remember me",
                                      style: TextStyle(
                                          color: Appstore.colorDark1,
                                          fontSize: 15,
                                          fontFamily: Appstore.appFont,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideTransitionLeftToRight(
                                            const ForgotPasswordScreen()));
                                  },
                                  child: Text(
                                    "Forgot password",
                                    style: TextStyle(
                                        color: Appstore.colorDark1,
                                        fontSize: 14,
                                        fontFamily: Appstore.appFont,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Sign In button
                            Bounce(
                              duration: const Duration(milliseconds: 180),
                              onPressed: () {
                                // Code
                                // after sign in is successffully
                                Navigator.pushReplacement(
                                    context,
                                    SlideTransitionRightToLeft(
                                        const BuildProfileScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: PrimaryButton(
                                    color: Appstore.colorPLighter,
                                    text: "Sign in",
                                    width: Appstore.debugValueDefault,
                                    margin: Appstore.defaultMarginButton),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        color: Appstore.colorDark1,
                                        fontSize: 15,
                                        fontFamily: Appstore.appFont,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Appstore.colorPLighter,
                                        fontSize: 15,
                                        fontFamily: Appstore.appFont,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const OrSeparator(),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Bounce(
                                        duration: const Duration(milliseconds: 180),
                                        onPressed: () {
                                          // google sign in code
                                        },
                                        child: Image.asset(Appstore.googleIcon,
                                            width: 35, height: 35),
                                      ),
                                      Bounce(
                                        duration: const Duration(milliseconds: 180),
                                        onPressed: () {
                                          // facebook sign in code
                                        },
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.blue.shade700,
                                          size: 35,
                                        ),
                                      ),
                                      Bounce(
                                        duration: const Duration(milliseconds: 180),
                                        onPressed: () {
                                          // apple sign in code
                                        },
                                        child: Image.asset(Appstore.appleIcon,
                                            width: 35, height: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
