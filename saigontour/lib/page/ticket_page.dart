import 'package:flutter/material.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/service/customer_service.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:saigontour/consts/colors.dart';

import '../widget/ticket_data.dart';
import '../widget/ticket_detail_widget.dart';

class TicketPage extends StatefulWidget {
  //trang này để show ra những vé mà user đã đặt thành công
  const TicketPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

  


  @override
  Widget build(BuildContext context) {
    final service = CustomerService();
    if (service.loggedInCustomer == null)
      return MaterialApp(
        home: Scaffold(
          backgroundColor: blackBG,
          body: Center(
            child: Text("Not logged in", style: TextStyle(color: Colors.white)),
          ),
        ),
      );
    final tourDetails = service.loggedInCustomer!.tourDetails;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: blackBG,
          body: ListView.builder(
              itemCount: tourDetails.length,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TicketWidget(
                      width: 350,
                      height: 500,
                      isCornerRounded: true,
                      padding: EdgeInsets.all(17),
                      margin: EdgeInsets.all(5.0),
                      color: white,
                      child: TicketData(tourDetails[index])),
                );
              })),
    );
  }
}
