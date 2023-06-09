import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saigontour/models/tour_model.dart';

import '../consts/colors.dart';
import '../models/nearby_places_model.dart';
import '../page/tourist_details_page.dart';
import 'distance.dart';

Widget HomeTourCard(BuildContext context, TourModel tour) {
  print(tour);
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      height: 135,
      width: 360,
      child: Card(
        color: blackTextFild,
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TouristDetailsPage(
                    image: nearbyPlaces[0].image,
                    tour: tour,
                  ),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    nearbyPlaces[0].image,
                    height: double.maxFinite,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tour.name!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: littleWhite),
                      ),
                      Text(
                        tour.description!,
                        style: TextStyle(fontSize: 12, color: littleWhite),
                      ),
                      const SizedBox(height: 10),
                      // DISTANCE WIDGET
                      Distance(
                        paths: tour.tourPath,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 14,
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: white,
                                ),
                                text: NumberFormat.currency(
                                        locale: "eu",
                                        symbol: "VND",
                                        decimalDigits: 0)
                                    .format(tour.price?.toInt()),
                                children: const [
                                  TextSpan(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: purpButton,
                                      ),
                                      text: "/ Người")
                                ]),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
