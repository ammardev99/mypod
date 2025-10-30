import 'package:flutter/material.dart';

Widget heading18(String txt, {Color? color, bool alignC = false}) {
  return Text(
    txt,
    textAlign: alignC ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    ),
  );
}

Widget heading14(String txt, {Color? color}) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    ),
  );
}

Widget infoText(String txt, {Color? labelcolor = Colors.black, bool? alignC}) {
  return Text(
    txt,
    textAlign: alignC == true ? TextAlign.center : null,
    style: TextStyle(fontSize: 12, color: labelcolor),
  );
}

Widget gapBox(double w, {double? h}) {
  return SizedBox(width: w, height: h ?? w);
}
