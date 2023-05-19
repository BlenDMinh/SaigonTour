import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saigontour/consts/style.dart';
import 'package:saigontour/models/login_response.dart';
import 'package:saigontour/page/credit_card_payment.dart';
import 'package:saigontour/page/home_page.dart';
import 'package:saigontour/page/login_page.dart';
import 'package:saigontour/page/ticket_page.dart';
import 'package:saigontour/page/welcome_page.dart.dart';
import 'package:saigontour/service/customer_service.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    CustomerService().login().whenComplete(() {
      print("Login as: " + CustomerService().loggedInCustomer.toString());
      // Login bang token co san trong may neu co
      runApp(
          MyApp()); // hàm main để chạy page đầu tiên khi khởi động app(ở đây là welcome)
    }).timeout(Duration(seconds: 1), onTimeout: () {
      return LoginResponse(null, null, null);
    }).onError((error, stackTrace) => LoginResponse(null, null, null));
  } catch (e) {
    e.printError();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Tour Booking',
        debugShowCheckedModeBanner: false,
        theme: Stlyes.themeData(),
        home: WelcomePage(),
      ),
    );
  }
}
