import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/space.dart';
import 'package:saigontour/consts/text_style_log.dart';
import 'package:saigontour/models/customer.dart';
import 'package:saigontour/models/register_info.dart';
import 'package:saigontour/service/customer_service.dart';

import 'package:saigontour/widget/main_button.dart';
import 'package:saigontour/widget/text_fild.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //Các controller để quản lí các text nhập vào
  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userPh = TextEditingController();

  var service = CustomerService();
  @override
  Widget build(BuildContext context) {
    var customer = service.loggedInCustomer;
    if (customer == null) return Scaffold();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: purpButton,
        ),
        backgroundColor: blackBG,
        elevation: 0,
      ),
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 0.0),
              Text(
                'Cập nhật tài khoản',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Điền vào form',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userName,
                image: CupertinoIcons.person,
                keyBordType: TextInputType.name,
                hintTxt: 'Họ và tên',
              ),
              textFild(
                controller: age,
                image: CupertinoIcons.person,
                keyBordType: TextInputType.name,
                hintTxt: 'Tuổi',
              ),
              SpaceVH(height: 60.0),
              Mainbutton(
                onTap: () {
                  customer.fullname = userName.text;
                  customer.age = int.parse(age.text);
                  service.update().then((value) {
                    Navigator.of(context).pop();
                  });
                },
                text: 'Cập nhật',
                btnColor: purpButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
