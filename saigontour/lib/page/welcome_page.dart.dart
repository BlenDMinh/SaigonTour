import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/page/home_page.dart';
import 'package:saigontour/page/my_bottom_navigation_bar.dart';

class WelcomePage extends StatelessWidget { //trang welcome
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/illustration.png',
                ),
                const SizedBox(height: 40),
                const Text(
                  "Khám phá những khu du lịch mới",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Địa điểm bạn muốn du lịch \n Tất cả có ở Sài Gòn Tour",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyBottomNavigationBar(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8.0,
                        ),
                      ),
                      child: const Text("Bắt đầu"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
