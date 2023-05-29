import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/text_style_log.dart';
import 'package:saigontour/page/edit_profile_page.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';
import 'package:saigontour/service/customer_service.dart';

import '../widget/main_button.dart';
import '../widget/text_fild.dart';

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
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(icon, size: 20, color: purpButton),
        SizedBox(
          width: 25,
        ),
        Text(info!,
            style: TextStyle(
                fontSize: 16, color: littleWhite, fontWeight: FontWeight.w200))
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
  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController userPh = TextEditingController();
  var service = CustomerService();
  @override
  Widget build(BuildContext context) {
    final customer = service.loggedInCustomer!;
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 30.0),
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
              icon: CupertinoIcons.person,
              info: customer.fullname.toString(),
            ),
            InfoBox(
              icon: CupertinoIcons.person,
              info: customer.age.toString(),
            ),
            InfoBox(
              icon: CupertinoIcons.phone,
              info: customer.phoneNumber,
            ),
            //textFild(
            //  controller: userName,
            //  image: CupertinoIcons.person,
            //  keyBordType: TextInputType.name,
            //  hintTxt: customer.fullname.toString(),
            //),
            //textFild(
            //  controller: age,
            //  image: CupertinoIcons.person,
            //  keyBordType: TextInputType.name,
            //  hintTxt: customer.age.toString(),
            //),
            //textFild(
            //  controller: userPh,
            //  image: CupertinoIcons.phone,
            //  keyBordType: TextInputType.phone,
            //  hintTxt: customer.phoneNumber.toString(),
            //),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 30,
            ),
            Mainbutton(
              onTap: () {
                service.logout().then((value) {
                  MNavigator.instance.navigate(0);
                });
              },
              text: 'Đăng xuất',
              btnColor: purpButton,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage()), // chữ Sign Up để move tới trang đăng kí
                );
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Chỉnh sửa thông tin,',
                    style: headline.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                    text: ' cập nhật',
                    style: headlineDot.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
