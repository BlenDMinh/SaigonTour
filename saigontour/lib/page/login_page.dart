import 'package:get/get.dart';
import 'package:saigontour/models/login_request.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/space.dart';
import 'package:saigontour/consts/text_style_log.dart';
import 'package:saigontour/page/profile_page.dart';
import 'package:saigontour/page/sign_up.dart';
import 'package:saigontour/page/welcome_page.dart.dart';
import 'package:saigontour/service/customer_service.dart';
import 'package:saigontour/widget/main_button.dart';
import 'package:saigontour/widget/text_fild.dart';

import 'my_bottom_navigation_bar.dart';

class LoginPage extends StatelessWidget {
  final CustomerService service = CustomerService();
  // Tạo đối tượng service để xử lí
  TextEditingController phoneNum = TextEditingController();
  //controller để quản lí số đt
  TextEditingController userPass = TextEditingController();
//controller để quản lí password
  @override
  Widget build(BuildContext context) {
    print(service.loggedInCustomer);
    if (service.loggedInCustomer != null) return ProfilePage();
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Welcome Back!',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please sign in to your account',
                style: headline3,
              ),
              SpaceVH(height: 80.0),
              textFild(
                controller: phoneNum,
                image: CupertinoIcons.phone,
                hintTxt: 'Phone Number',
              ),
              textFild(
                controller: userPass,
                image: CupertinoIcons.lock,
                isObs: true,
                hintTxt: 'Password',
              ),
              SpaceVH(height: 80.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {
                        service
                            .login(
                                request: LoginRequest.ByPassword(
                                    phoneNum.value.text, userPass.value.text))
                            .then((value) {
                          print(service.loggedInCustomer);
                          MNavigator.instance.navigate(0);
                        }).onError((error, stackTrace) {
                          error.printError();
                          stackTrace.printError();
                        }); // Gửi request để server check password
                        // .timeout(Duration(seconds: 1), onTimeout: () {});
                        //nút sign in để move tới trang home
                      },
                      text: 'Sign in',
                      btnColor: purpButton,
                    ),
                    SpaceVH(height: 30.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage()), // chữ Sign Up để move tới trang đăng kí
                        );
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
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
