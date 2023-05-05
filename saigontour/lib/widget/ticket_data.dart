import 'package:flutter/material.dart';
import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/models/user_type.dart';
import 'package:saigontour/widget/ticket_detail_widget.dart';

Widget TicketData({required TourDetail tourDetail}) { //phần data của từng ticket
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120.0,
            height: 25.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(width: 1.0, color: Colors.green),
            ),
            child: Center(
              child: Text(
                tourDetail.vehicle,
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                tourDetail.tourModel?.tourPath[0] ?? "Đà Nẵng",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.pink,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  tourDetail.tourModel?.tourPath[1] ?? "Nha Trang",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(
          'Tour Ticket',
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ticketDetailsWidget(
                'Passengers',
                tourDetail.tourCustomer?.fullname ?? "Monsieur Charcuter",
                'Date',
                tourDetail.tourModel?.startTime.toString() ??
                    "2023/07/26 15:00"),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 31.0),
              child: ticketDetailsWidget(
                  'Tour',
                  tourDetail.tourModel?.tourId.toString() ?? "7687334A45",
                  'Price',
                  tourDetail.tourModel?.price.toString() ?? "500.000 VND"),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 59.0),
                child: ticketDetailsWidget(
                    'Type',
                    tourDetail.userType == UserType.ADULT ? "Adult" : "Child",
                    'Payment',
                    "MOMO")),
          ],
        ),
      ),
      Center(
        child: Container(
          width: 210.0,
          height: 210.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/qrcode.png'),
                  fit: BoxFit.cover)),
        ),
      ),
      Center(
        child: Text(
          '+84(std nha xe)923849012',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

List<Widget> ticketDataList = [
  TicketData(
      tourDetail: new TourDetail(null, null, "43B 273 73", UserType.ADULT)),
  TicketData(
      tourDetail: new TourDetail(null, null, "43B 273 73", UserType.KID)),
  TicketData(
      tourDetail: new TourDetail(null, null, "43B 273 73", UserType.KID)),
  TicketData(
      tourDetail: new TourDetail(null, null, "43B 273 73", UserType.ADULT)),
];
