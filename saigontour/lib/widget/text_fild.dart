import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/text_style_log.dart';

Widget textFildNumOfPeople({
  //một kiểu text để nhập form vào
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  required IconData image,
}) {
  return Container(
    height: 30,
    padding: EdgeInsets.only(left: 8, top: 3, bottom: 3, right: 8),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: TextStyle(
                fontSize: 12,
                color: grayText,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: headline2,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 15,
          child: Icon(
            image,
            size: 15,
            color: grayText,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget textFild({
  //một kiểu text để nhập form vào
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  required IconData image,
}) {
  return Container(
    height: 70.0,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 220.0,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
            ),
            style: headline2,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 20,
          child: Icon(
            image,
            size: 20,
            color: grayText,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
