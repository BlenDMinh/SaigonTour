import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/page/login_page.dart';
import 'package:saigontour/page/ticket_page.dart';

import 'home_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  static final MyBottomNavigationBar instance = new MyBottomNavigationBar();
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  // cái navigation dưới màn hình dùng để move giữa các trang
  int _selectedIndex = 0;
  final List<Widget> pages = [
    HomePage.instance,
    TicketPage(), //để tạm login page vì chưa làm
    TicketPage(),
    LoginPage(),
  ]; //có 4 trang và nhiều widget khác

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[_selectedIndex], // phần dưới chỉ là setup các trang để move
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: blackBG,
          selectedItemColor: purpButton,
          unselectedItemColor: grayText,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.bookmark_outline),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.ticket_outline),
              label: "Ticket",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              label: "Profile",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
