import 'package:flutter/material.dart';
import 'package:saigontour/consts/colors.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: blackTextFild,
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/map.png',
              width: 100,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Vị trí của bạn",
                    style: TextStyle(fontSize: 20, color: purpButton)),
                const SizedBox(height: 5),
                Text(
                  "TP Hồ Chí Minh, Việt Nam",
                  style: TextStyle(fontSize: 14, color: littleWhite),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
