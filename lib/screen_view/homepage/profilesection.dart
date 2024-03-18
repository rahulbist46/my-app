import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:flutter/material.dart';

Widget profileSection() {
  return Row(
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/image (1).webp'),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("EdHippo", style: headingText24()),
              Text("Academy", style: headingText24(color: greenColor())),
            ],
          ),
        ],
      ),
      const Spacer(),
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: greenColor(),
            width: 2,
          ),
        ),
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.pink,
          child: Text('A'),
        ),
      ),
    ],
  );
}
