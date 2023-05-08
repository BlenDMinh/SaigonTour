import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: blackBG,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: purpButton,
        ),
        body: FutureBuilder(builder: ),
      ),
    );
  }
}
