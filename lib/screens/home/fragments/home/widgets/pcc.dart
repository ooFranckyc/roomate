import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class PopularCitieCard extends StatefulWidget {
  final int index; // remove this
  final List<String> imgCenteredIndex; // remove this again
  const PopularCitieCard(
      {super.key, required this.index, required this.imgCenteredIndex});

  @override
  State<PopularCitieCard> createState() => _PopularCitieCardState();
}

class _PopularCitieCardState extends State<PopularCitieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // apartment model layout view
      width: 150,
      height: 150,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: NetworkImage(widget.imgCenteredIndex[widget.index])),
          color: Appstore.colorDark3,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Apart: ${widget.index + 1}",
        style: TextStyle(
            color: Appstore.colorDark1,
            fontSize: 16,
            fontFamily: Appstore.appFont,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
