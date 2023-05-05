import 'package:flutter/material.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:saigontour/consts/colors.dart';

import '../widget/ticket_data.dart';
import '../widget/ticket_detail_widget.dart';



class TicketPage extends StatelessWidget {//trang này để show ra những vé mà user đã đặt thành công
  const TicketPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: blackBG,
          body: ListView.builder(
              itemCount: ticketDataList.length,
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
                      child: ticketDataList[index]),
                );
              })),
    );
  }
}

//SingleChildScrollView(
//      scrollDirection: Axis.vertical,
//      child: Column(children: [
//        SizedBox(
//          height: 40,
//        ),
//        TicketWidget(
//          width: 350,
//          height: 500,
//          isCornerRounded: true,
//          padding: EdgeInsets.all(20),
//          child: TicketData(tourDetail: Tour),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        TicketWidget(
//          width: 350,
//          height: 500,
//          isCornerRounded: true,
//          padding: EdgeInsets.all(20),
//          child: TicketData(),
//        ),
//        SizedBox(
//          height: 10,
//        ),
//        TicketWidget(
//          width: 350,
//          height: 500,
//          isCornerRounded: true,
//          padding: EdgeInsets.all(20),
//          child: TicketData(),
//        ),
//      ]),
//    );