import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saigontour/consts/colors.dart';

class Distance extends StatelessWidget {
  const Distance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Ionicons.locate_outline,
          color: purpButton,
          size: 14,
        ),
        const Text(
          "Accra",
          style: TextStyle(
            color: grayText,
          ),
        ),
        const SizedBox(width: 3),
        ...List.generate(
          18,
          (index) {
            return Expanded(
              child: Container(
                height: 2,
                color: index.isOdd ? Colors.transparent : grayText,
              ),
            );
          },
        ),
        const SizedBox(width: 3),
        Icon(
          Ionicons.location_outline,
          size: 14,
          color: purpButton,
        ),
        const SizedBox(width: 2),
        Text(
          "Kumasi",
          style: TextStyle(
            color: purpButton,
          ),
        )
      ],
    );
  }
}
