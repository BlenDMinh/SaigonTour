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
              "Chào buổi sáng",
              style: TextStyle(fontSize: 13),
            ),
            Text(
              "Saigontour",
              style: TextStyle(
                  color: whiteColor, fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            icon: Icon(
              Ionicons.search,
              color: white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: Icon(
                Ionicons.notifications,
                color: white,
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
                "Gợi ý địa điểm ",
                style: TextStyle(
                    color: white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Xem tất cả",
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
                "Gần bạn",
                style: TextStyle(
                    color: white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Xem tất cả",
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
