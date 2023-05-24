import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/recommended_places_model.dart';
import 'package:saigontour/models/tour_model.dart';
import 'package:saigontour/page/tourist_details_page.dart';

class RecommendedPlaces extends StatefulWidget {
  //recommendation

  List<TourModel> tour;
  RecommendedPlaces({Key? key, required this.tour}) : super(key: key);

  @override
  State<RecommendedPlaces> createState() => _RecommendedPlacesState();
}

class _RecommendedPlacesState extends State<RecommendedPlaces> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 220,
              child: Card(
                elevation: 0.4,
                color: blackTextFild,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TouristDetailsPage(
                              image: recommendedPlaces[
                                      index % recommendedPlaces.length]
                                  .image,
                              tour: this.widget.tour[index]),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            recommendedPlaces[index].image,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: 70,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              this.widget.tour[index].tourPath.first,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: littleWhite),
                            ),
                            const Spacer(),
                            Text(
                              (this.widget.tour[index].price).toString(),
                              style:
                                  TextStyle(fontSize: 12, color: littleWhite),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Ionicons.location,
                              color: purpButton,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              this.widget.tour[index].tourPath.last,
                              style:
                                  TextStyle(fontSize: 12, color: littleWhite),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
          itemCount: this.widget.tour.length),
    );
  }
}
