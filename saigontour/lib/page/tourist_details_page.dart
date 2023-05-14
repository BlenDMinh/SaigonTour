// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/page/credit_card_payment.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';
import 'package:saigontour/page/ticket_page.dart';
import 'package:saigontour/widget/distance.dart';
import 'package:saigontour/widget/text_fild.dart';

import '../models/tour_model.dart';

class TouristDetailsPage extends StatefulWidget {
  // trang này show ra info chi tiết của địa điểm user muốn xem
  const TouristDetailsPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  State<TouristDetailsPage> createState() => _TouristDetailsPageState();
}

class _TouristDetailsPageState extends State<TouristDetailsPage> {
  TextEditingController numOfPeople = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (numOfPeople.text == "") numOfPeople.text = "0";
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
                      tourModelList[0].name,
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      tourModelList[0].description,
                      style: TextStyle(color: littleWhite),
                    )
                  ],
                ),
                const Spacer(),
                // money part
                textFildNumOfPeople(
                    hintTxt: 'Số người đi',
                    controller: numOfPeople,
                    keyBordType: TextInputType.number,
                    image: Icons.people),
                const Spacer(),

                Text(
                  "${(tourModelList[0].price * int.parse(numOfPeople.text)).toString()} VND",
                  style: TextStyle(fontSize: 12, color: Colors.yellowAccent),
                )
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
                    Text("${tourModelList[0].startTime.day.toString()}/${tourModelList[0].startTime.month.toString()}/${tourModelList[0].startTime.year.toString()}",
                        style: TextStyle(fontSize: 20, color: whiteColor)),

                    const SizedBox(height: 1),
                    Text(
                      "Bắt đầu vào",
                      style: TextStyle(color: littleWhite),
                    ),
                    Text("${tourModelList[0].startTime.hour.toString()}:${tourModelList[0].startTime.minute.toString()}:${tourModelList[0].startTime.second.toString()}",
                        style: TextStyle(fontSize: 20, color: whiteColor)),
                    const SizedBox(height: 1),
                    
                  ],
                ),
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
            const Distance(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                //MNavigator.instance.navigate(2);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditCardPayment()));
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
