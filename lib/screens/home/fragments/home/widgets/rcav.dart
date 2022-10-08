import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';


class RecommandedCard extends StatefulWidget {
  final String img;
  final String tag;
  final String title;
  final String location;
  final String flags;
  final double priceByMonth;
  const RecommandedCard(
      {super.key,
      required this.img,
      required this.tag,
      required this.title,
      required this.location,
      required this.flags,
      required this.priceByMonth});

  @override
  State<RecommandedCard> createState() => _RecommandedCardState();
}

class _RecommandedCardState extends State<RecommandedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 390,
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.only(right: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Appstore.colorDark1.withOpacity(.20),
                spreadRadius: .15,
                blurRadius: .15)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // bg of apartment
          Container(
            height: 210,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Appstore.colorDark2.withOpacity(.40),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.img)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // status of free apartment
                Container(
                  width: 100,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Appstore.colorPSubtle.withOpacity(.60),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  child: Text(
                    widget.tag,
                    style: TextStyle(
                        color: Appstore.colorDark1,
                        fontSize: 14,
                        fontFamily: Appstore.appFont,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 5),
                // title
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Appstore.colorDark1.withOpacity(.80),
                    fontSize: 16,
                    fontFamily: Appstore.appFont,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                // location
                Text(
                  widget.location,
                  style: TextStyle(
                    color: Appstore.colorDark2.withOpacity(.80),
                    fontSize: 14,
                    fontFamily: Appstore.appFont,
                  ),
                ),
                // Flag
                Text(
                  widget.flags,
                  style: TextStyle(
                      color: Appstore.colorDark1.withOpacity(.75),
                      fontSize: 14,
                      fontFamily: Appstore.appFont,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                // price by months
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$${widget.priceByMonth}",
                      style: TextStyle(
                          color: Appstore.colorDark1.withOpacity(.55),
                          fontSize: 14,
                          fontFamily: Appstore.appFont,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "/Month",
                      style: TextStyle(
                          color: Appstore.colorDark2.withOpacity(.90),
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
