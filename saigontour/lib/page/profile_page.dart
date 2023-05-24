import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/text_style_log.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';
import 'package:saigontour/service/customer_service.dart';

import '../widget/main_button.dart';

class InfoBox extends StatelessWidget {
  IconData? icon;
  String? info;
  InfoBox({this.icon, this.info});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      height: 70.0,
      decoration: BoxDecoration(
          color: blackTextFild, borderRadius: BorderRadius.circular(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(icon, size: 20, color: grayText),
        Text(info!, style: headline2)
      ]),
    ));
  }
}

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              "assets/image/profile.jpeg",
              height: 170,
              width: 170,
            )));
  }
}

class ProfilePage extends StatelessWidget {
  var service = CustomerService();
  @override
  Widget build(BuildContext context) {
    final customer = service.loggedInCustomer!;
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Avatar(),
            Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  customer.fullname!,
                  style: headline2.copyWith(fontSize: 20),
                )),
            Text(
              "ID: " + customer.userId.toString(),
              style: TextStyle(color: grayText),
            ),
            InfoBox(
              icon: CupertinoIcons.check_mark,
              info: customer.age.toString(),
            ),
            InfoBox(
              icon: CupertinoIcons.phone,
              info: customer.phoneNumber,
            ),
            Mainbutton(
              onTap: () {
                service.logout().then((value) {
                  MNavigator.instance.navigate(0);
                });
              },
              text: 'Đăng xuất',
              btnColor: purpButton,
            )
          ],
        ),
      ),
    );
  }
}
