import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/consts/space.dart';
import 'package:saigontour/consts/text_style_log.dart';

import 'package:saigontour/widget/main_button.dart';
import 'package:saigontour/widget/text_fild.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: purpButton,
        ),
        backgroundColor: blackBG,
      ),
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Create new account',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please fill in the form to continue',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userName,
                image: CupertinoIcons.person,
                keyBordType: TextInputType.name,
                hintTxt: 'Full Name',
              ),
              textFild(
                controller: userEmail,
                keyBordType: TextInputType.emailAddress,
                image: CupertinoIcons.person,
                hintTxt: 'Email Address',
              ),
              textFild(
                controller: userPh,
                image: CupertinoIcons.phone,
                keyBordType: TextInputType.phone,
                hintTxt: 'Phone Number',
              ),
              textFild(
                controller: userPass,
                isObs: true,
                image: CupertinoIcons.lock,
                hintTxt: 'Password',
              ),
              SpaceVH(height: 80.0),
              Mainbutton(
                onTap: () {},
                text: 'Sign Up',
                btnColor: purpButton,
              ),
              SpaceVH(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign In',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
