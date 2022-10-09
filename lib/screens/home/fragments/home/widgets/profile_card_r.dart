import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class ProfileCardRoommate extends StatefulWidget {
  final String img;
  final String roommateName;
  final int roommateYear;
  final String roommateCountry;
  final String roommateSex;
  final String roommateStatus;
  final String roommateReligion;
  final double budgetOfRoommate;
  const ProfileCardRoommate(
      {super.key,
      required this.img,
      required this.roommateName,
      required this.roommateYear,
      required this.roommateCountry,
      required this.roommateSex,
      required this.roommateStatus,
      required this.roommateReligion,
      required this.budgetOfRoommate});

  @override
  State<ProfileCardRoommate> createState() => _ProfileCardRoommateState();
}

class _ProfileCardRoommateState extends State<ProfileCardRoommate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.only(right: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Appstore.colorDark1.withOpacity(.50),
                spreadRadius: .20,
                blurRadius: .20)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // bg of roommate
          Container(
            height: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Appstore.colorDark3,
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: NetworkImage(widget.img)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // name
                    Text(
                      "${widget.roommateName}, ${widget.roommateYear}yrs",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.80),
                          fontSize: 16,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      CupertinoIcons.checkmark_seal,
                      size: 20,
                      color: Appstore.colorPLighter,
                    )
                  ],
                ),
                // description
                Text(
                  "${widget.roommateCountry}, Immediate",
                  style: TextStyle(
                      color: Appstore.colorDark1.withOpacity(.75),
                      fontSize: 14,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 5),
                Text(
                  "${widget.roommateSex} + ${widget.roommateStatus} + ${widget.roommateReligion}",
                  style: TextStyle(
                      color: Appstore.colorDark2.withOpacity(.95),
                      fontSize: 14,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Budget: ",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.75),
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "\$${widget.budgetOfRoommate}",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.90),
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "/Month",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.65),
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
