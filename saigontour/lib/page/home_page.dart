import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/models/user_type.dart';
import 'package:saigontour/service/tour_service.dart';
import 'package:saigontour/widget/custom_icon_button.dart';
import 'package:saigontour/widget/home_tour_card.dart';
import 'package:saigontour/widget/location_card.dart';
import 'package:saigontour/widget/recommended_places.dart';
import 'package:saigontour/widget/tourist_places.dart';
import '../models/tour_model.dart';
import 'my_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  // page chính dùng để chọn địa điểm
  static final HomePage instance =
      HomePage(); // tạo ra cái route để move tới page này

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var service = TourService();
    return FutureBuilder<List<TourModel>>(
        future: service.getAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TourModel>> snapshot) {
          return Scaffold(
            backgroundColor: blackBG,
            appBar: AppBar(
              // phần đầu của app(tên app, icon tìm kiếm ....)
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: littleWhite,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Chào bạn",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "Saigontour",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            body: ListView(
              // list này là toàn bộ phần dưới phần appbar
              physics:
                  const BouncingScrollPhysics(), // kéo xuống có hiệu hứng bouncing
              padding: const EdgeInsets.all(14),
              children: [
                // LOCATION CARD để lấy địa chỉ hiện tại của user
                const LocationCard(),
                const SizedBox(
                  height: 15,
                ),
                //TouristPlaces nhấn vào để show ra các địa điểm du lịch theo sở thích(Núi, rừng, biển...) (Chưa làm)
                //const TouristPlaces(),
                // CATEGORIES Recommendation
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gợi ý địa điểm ",
                      style: TextStyle(
                          color: white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //Widget này là thanh slide để recommend các nơi nên đến (nằm trong folder widget)
                RecommendedPlaces(
                    tour: snapshot.data == null
                        ? []
                        : snapshot.data!
                            .sublist(0, min(snapshot.data!.length, 5))),
                const SizedBox(height: 10),
                // Phần này để show các địa điểm du lịch gần với user dựa vào location đã lấy từ LOCATION CARD
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tất cả",
                      style: TextStyle(
                          color: white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(
                      snapshot.data == null ? 0 : snapshot.data!.length,
                      (index) => HomeTourCard(context, snapshot.data![index])),
                )
                //nằm trong folder widget
                // const NearbyPlaces(),
              ],
            ),
          );
        });
  }
}
