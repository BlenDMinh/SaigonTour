import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/widget/custom_icon_button.dart';
import 'package:saigontour/widget/location_card.dart';
import 'package:saigontour/widget/nearby_places.dart';
import 'package:saigontour/widget/recommended_places.dart';
import 'package:saigontour/widget/tourist_places.dart';
import 'my_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  static final HomePage instance = HomePage();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: littleWhite,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 13),
            ),
            Text(
              "Saigontour",
              style: TextStyle(color: whiteColor, fontSize: 25),
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            icon: Icon(
              Ionicons.search_outline,
              color: littleWhite,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(
                Ionicons.notifications_outline,
                color: littleWhite,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          // LOCATION CARD
          const LocationCard(),
          const SizedBox(
            height: 15,
          ),
          const TouristPlaces(),
          // CATEGORIES
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: TextStyle(color: white, fontSize: 22),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const RecommendedPlaces(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby From You",
                style: TextStyle(color: white, fontSize: 22),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const NearbyPlaces(),
        ],
      ),
    );
  }
}
