import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomate/screens/home/fragments/home/widgets/pcc.dart';
import 'package:roomate/screens/home/fragments/home/widgets/profile_card_r.dart';
import 'package:roomate/screens/home/fragments/home/widgets/rcav.dart';
import 'package:roomate/utils/appstore.dart';
import 'package:roomate/utils/widgets/searchbar.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool notificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 1,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Appstore.colorWhite,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Appstore.colorWhite,
          elevation: 0,
        ),
        backgroundColor: Appstore.colorWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileHeader(),
                const SizedBox(height: 3),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SearchBarHome()),
                const SizedBox(height: 25),
                // popular citie
                exploreCitie(),
                const SizedBox(height: 20),
                recommandedRooms(),
                const SizedBox(height: 20),
                avaibleRoomates()
              ],
            ),
          ),
        ));
  }

  // list card recommandations roomates
  Widget avaibleRoomates() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          layourView(
              title: "Avaible Roommates",
              subtitle: "Get roommate based on your interests",
              textAction: "View more"),
          const SizedBox(height: 20),
          SizedBox(
            height: 325,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                ProfileCardRoommate(
                    img:
                        "https://images.pexels.com/photos/1181391/pexels-photo-1181391.jpeg?auto=compress&cs=tinysrgb&w=600",
                    roommateName: "Adam German",
                    roommateYear: 36,
                    roommateCountry: "Cameroon",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 20.220),
                ProfileCardRoommate(
                    img:
                        "https://images.pexels.com/photos/1036627/pexels-photo-1036627.jpeg?auto=compress&cs=tinysrgb&w=600",
                    roommateName: "Michael Cole",
                    roommateYear: 23,
                    roommateCountry: "USA",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 22.56),
                ProfileCardRoommate(
                    img:
                        "https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
                    roommateName: "Martin Dubois",
                    roommateYear: 20,
                    roommateCountry: "France",
                    roommateSex: "Male",
                    roommateStatus: "Student",
                    roommateReligion: "Christian",
                    budgetOfRoommate: 18.340),
              ],
            ),
          )
        ],
      ),
    );
  }

  // list card recommandations apartment
  Widget recommandedRooms() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          layourView(
              title: "Recommanded Rooms",
              subtitle: "Top notch rooms to suite your needs",
              textAction: "View more"),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: const [
                // for example build 4 element (that it's not optimized)
                RecommandedCard(
                    img:
                        "https://images.pexels.com/photos/1457844/pexels-photo-1457844.jpeg?auto=compress&cs=tinysrgb&w=600",
                    tag: "Avaible",
                    title: "Shared Bedroom, Canada",
                    location: "1 Bedroom, 3 Person, 1 Toilet",
                    flags: "TV, WIFI, AC",
                    priceByMonth: 10.110),
                RecommandedCard(
                    img:
                        "https://images.pexels.com/photos/1827054/pexels-photo-1827054.jpeg?auto=compress&cs=tinysrgb&w=600",
                    tag: "Avaible",
                    title: "Private Room, Cameroon",
                    location: "2 Bedroom, 1 Person, 2 Toilet",
                    flags: "TV, WIFI, Stand-by Gen",
                    priceByMonth: 27.110),
                RecommandedCard(
                    img:
                        "https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGFwYXJ0bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
                    tag: "News",
                    title: "Beautiful Large Apartement",
                    location: "4 Large rooms in Oguin",
                    flags: "TV, WIFI, Electricy",
                    priceByMonth: 10.110),
                RecommandedCard(
                    img:
                        "https://images.pexels.com/photos/922796/pexels-photo-922796.jpeg?auto=compress&cs=tinysrgb&w=600",
                    tag: "Avaible",
                    title: "Nice Bedroom, France",
                    location: "2 Bedroom, 2 Person, 2 Toilet",
                    flags: "TV, WIFI, AC",
                    priceByMonth: 23.110),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<String> listParssesAppartement = [
    "https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/439227/pexels-photo-439227.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1648771/pexels-photo-1648771.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1571468/pexels-photo-1571468.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/276583/pexels-photo-276583.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];

  // this list represent the explore must cities
  Widget exploreCitie() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          layourView(
              title: "Explore popular cities",
              subtitle: "Check for apartment",
              textAction: "View more"),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                for (int i = 0; i < 5; i++)
                  PopularCitieCard(
                    index: i,
                    imgCenteredIndex: listParssesAppartement,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  // layout view for build a doule information widget
  Widget layourView(
      {required String title,
      required String subtitle,
      required String textAction}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Appstore.colorDark1,
              fontFamily: Appstore.appFont,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: TextStyle(
                  color: Appstore.colorDark1,
                  fontSize: 14,
                  fontFamily: Appstore.appFont,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  textAction,
                  style: TextStyle(
                      color: Appstore.colorDark1,
                      fontFamily: Appstore.appFont,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Appstore.colorDark1,
                  size: 20,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget profileHeader() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('ressources/images/user.png')),
                    color: Appstore.colorDark3,
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Franck Mekoulou",
                    style: TextStyle(
                        color: Appstore.colorDark1,
                        fontFamily: Appstore.appFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Let's start your search",
                    style: TextStyle(
                        color: Appstore.colorDark2,
                        fontFamily: Appstore.appFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSwitch(
                    value: notificationEnabled,
                    activeColor: Appstore.colorPLighter,
                    onChanged: (vl) {
                      setState(() {
                        notificationEnabled = !notificationEnabled;
                      });
                    }),
              ),
              const SizedBox(width: 5),
              Icon(
                CupertinoIcons.bell,
                size: 27,
                color: Appstore.colorDark1,
              )
            ],
          )
        ],
      ),
    );
  }
}
