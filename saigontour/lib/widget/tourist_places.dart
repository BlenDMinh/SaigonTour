import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/tourist_places_model.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Chip(
            label: Text(
              touristPlaces[index].name,
              style: TextStyle(color: littleWhite),
            ),
            avatar: CircleAvatar(
              backgroundImage: AssetImage(touristPlaces[index].image),
            ),
            backgroundColor: blackTextFild,
            elevation: 0.4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          );
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.only(right: 10)),
        itemCount: touristPlaces.length,
      ),
    );
  }
}
