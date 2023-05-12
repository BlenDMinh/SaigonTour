import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';
import 'package:saigontour/models/payment_method.dart';
import 'package:saigontour/widget/text_fild.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}


class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final fullnameController = TextEditingController();
    final ageController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final startTimeController = TextEditingController();
    final tourDetailController = TextEditingController();
    final paymentController = TextEditingController();
    paymentController.text = "Momo";
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: blackBG,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: purpButton,
        ),
        body: Column(
          children: [
            
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          textFild(
                              hintTxt: 'Full name',
                              controller: fullnameController,
                              image: Icons.person),
                          textFild(
                              hintTxt: 'Age',
                              controller: ageController,
                              image: Icons.person),
                        ],
                      ),
                    );
                  }),
            ),
            
          ],
        ),
      ),
    );
  }
}
