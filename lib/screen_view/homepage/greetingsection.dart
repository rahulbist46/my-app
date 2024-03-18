import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:flutter/material.dart';

greetingSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
           Text("Hey,",style: bodyText14()),
          Text("Rahul", style: bodyText14(color: greenColor())),
        ],
      ),
      const Text("Find top schools across India"),
    ],
  );
}
