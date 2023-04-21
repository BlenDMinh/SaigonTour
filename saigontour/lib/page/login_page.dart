import 'package:saigontour/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/space.dart';
import 'package:saigontour/consts/text_style_log.dart';
import 'package:saigontour/page/sign_up.dart';
import 'package:saigontour/page/welcome_page.dart.dart';
import 'package:saigontour/widget/main_button.dart';
import 'package:saigontour/widget/text_fild.dart';

import 'my_bottom_navigation_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNum = TextEditingController();
  TextEditingController userPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Chào mừng trở lại!',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Vui lòng đăng nhập vào tài khoản của bạn',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: phoneNum,
                image: CupertinoIcons.phone,
                hintTxt: 'Số điện thoại',
              ),
              textFild(
                controller: userPass,
                image: CupertinoIcons.lock,
                isObs: true,
                hintTxt: 'Mật khẩu',
              ),
              SpaceVH(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Quên mật khẩu?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              SpaceVH(height: 100.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      text: 'Đăng nhập',
                      btnColor: purpButton,
                    ),
                    SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {},
                      text: 'Đăng nhập với tài khoản google',
                      image: 'google.png',
                      btnColor: white,
                      txtColor: blackBG,
                    ),
                    SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Chưa có tài khoản? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Đăng ký',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
