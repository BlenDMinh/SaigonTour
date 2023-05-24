import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/tour_detail.dart';
import 'package:saigontour/models/user_type.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';
import 'package:saigontour/service/customer_service.dart';
import 'package:saigontour/widget/ticket_detail_widget.dart';

class TicketData extends StatefulWidget {
  final TourDetail tourDetail;
  Function? callback = null;

  TicketData({required this.tourDetail, this.callback});

  @override
  State<TicketData> createState() => _TicketDataState();
}

class _TicketDataState extends State<TicketData> {
  Route<Object?> _dialogDoubleCheckBuilder(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: const Text("Are you sure?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Delete'),
              onPressed: () {
                final service = CustomerService();
                service.loggedInCustomer?.tourDetails.remove(widget.tourDetail);
                service.update().then((value) {
                  Navigator.of(context).pop();
                  setState(() {});
                  this.widget.callback?.call();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.tourDetail.vehicle,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  widget.tourDetail.tourModel?.tourPath[0] ?? "Đà Nẵng",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
                    widget.tourDetail.tourModel?.tourPath[1] ?? "Nha Trang",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
              child: Text(
                widget.tourDetail.tourModel!.name.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0, right: 20, left: 50),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      _dialogDoubleCheckBuilder(context),
                    );
                  },
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      'Delete',
                      style: TextStyle(color: white),
                    )),
                  ),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Passenger',
                        style: TextStyle(color: Colors.black38, fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                          widget.tourDetail.tourCustomer?.fullname ??
                              "Monsieur Charcuter",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Tour',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12)),
                      Text(
                          widget.tourDetail.tourModel?.tourId.toString() ??
                              "7687334A45",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Type',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12)),
                      Text(
                          widget.tourDetail.userType == UserType.ADULT
                              ? "Adult"
                              : "Child",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12)),
                      Text(
                          widget.tourDetail.tourModel != null
                              ? DateFormat("dd-MM-yyyy hh:mm").format(
                                  widget.tourDetail.tourModel!.startTime!)
                              : "2023/07/26 15:00",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Price',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12)),
                      Text(
                          NumberFormat.currency(
                                      locale: 'eu',
                                      symbol: "VND",
                                      decimalDigits: 0)
                                  .format(widget.tourDetail.tourModel?.price) ??
                              "500.000 VND",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Payment',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 12)),
                      Text("Credit card",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  )
                ],
              )
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
}
