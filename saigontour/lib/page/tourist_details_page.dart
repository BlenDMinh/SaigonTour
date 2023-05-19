// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/models/user_type.dart';
import 'package:saigontour/page/credit_card_payment.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';
import 'package:saigontour/page/ticket_page.dart';
import 'package:saigontour/service/customer_service.dart';
import 'package:saigontour/widget/distance.dart';
import 'package:saigontour/widget/text_fild.dart';

import '../models/tour_model.dart';

class TouristDetailsPage extends StatefulWidget {
  // trang này show ra info chi tiết của địa điểm user muốn xem
  TourModel tour;
  TouristDetailsPage({
    Key? key,
    required this.tour,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  State<TouristDetailsPage> createState() =>
      _TouristDetailsPageState(this.tour);
}

class _TouristDetailsPageState extends State<TouristDetailsPage> {
  TourModel tour;
  _TouristDetailsPageState(this.tour);
  TextEditingController numOfAdult = TextEditingController();
  TextEditingController numOfChildren = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (numOfAdult.text == "") numOfAdult.text = "0";
    if (numOfChildren.text == "") numOfChildren.text = "0";
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackBG,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.maxFinite,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: blackTextFild,
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 20,
                            icon: const Icon(Ionicons.chevron_back),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(Ionicons.heart_outline),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.tour.name!,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      this.tour.description!,
                      style: TextStyle(color: littleWhite),
                    )
                  ],
                ),
                const Spacer(),
                // money part
                Column(
                  children: [
                    Text('Vé người lớn',
                        style: TextStyle(fontSize: 12, color: littleWhite)),
                    textFildNumOfPeople(
                        hintTxt: 'Số người đi',
                        controller: numOfAdult,
                        keyBordType: TextInputType.number,
                        image: Icons.people),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text('Vé trẻ em (giảm 50%)',
                        style: TextStyle(fontSize: 12, color: littleWhite)),
                    textFildNumOfPeople(
                        hintTxt: 'Số người đi',
                        controller: numOfChildren,
                        keyBordType: TextInputType.number,
                        image: Icons.people),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "${this.tour.startTime!.day.toString()}/${this.tour.startTime!.month.toString()}/${this.tour.startTime!.year.toString()}",
                        style: TextStyle(fontSize: 20, color: whiteColor)),
                    const SizedBox(height: 1),
                    Text(
                      "Bắt đầu vào",
                      style: TextStyle(color: littleWhite),
                    ),
                    Text(
                        "${this.tour.startTime!.hour.toString()}:${this.tour.startTime!.minute.toString()}:${this.tour.startTime!.second.toString()}",
                        style: TextStyle(fontSize: 20, color: whiteColor)),
                    const SizedBox(height: 1),
                  ],
                ),
                Text(
                  "${NumberFormat.currency(locale: 'eu', symbol: "VND", decimalDigits: 0).format(this.tour.price! * (double.parse(numOfAdult.text) + double.parse(numOfChildren.text) / 2))}",
                  style: TextStyle(fontSize: 16, color: Colors.yellowAccent),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 180,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: blackTextFild,
                image: const DecorationImage(
                  image: AssetImage('assets/map.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Distance(
              paths: this.tour.tourPath,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                //MNavigator.instance.navigate(2);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditCardPayment(
                              tourDetails: () {
                                final service = CustomerService();
                                var tourDetails = <TourDetail>[];
                                for (int i = 0;
                                    i < int.parse(numOfAdult.text);
                                    i++) {
                                  TourDetail tourDetail = TourDetail(
                                      this.tour,
                                      service.loggedInCustomer!,
                                      "Máy bay",
                                      UserType.ADULT);
                                  tourDetails.add(tourDetail);
                                }
                                for (int i = 0;
                                    i < int.parse(numOfChildren.text);
                                    i++) {
                                  TourDetail tourDetail = TourDetail(
                                      this.tour,
                                      service.loggedInCustomer!,
                                      "Máy bay",
                                      UserType.KID);
                                  tourDetails.add(tourDetail);
                                }
                                return tourDetails;
                              }.call(),
                            )));
                //Navigator.pop(context);
// nhấn join this tour để move tới trang ticket
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: purpButton,
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
              ),
              child: const Text("Join this tour"),
            )
          ],
        ),
      ),
    );
  }
}
