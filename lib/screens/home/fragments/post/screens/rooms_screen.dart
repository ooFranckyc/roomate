import 'package:flutter/material.dart';
import 'package:roomate/utils/appstore.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstore.colorWhite,
      body: Column(),
    );
  }
}