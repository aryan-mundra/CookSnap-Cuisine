import 'package:flutter/material.dart';

//* FUNDAMENTALS
Color bgColor = Colors.white;
Color primaryColor = Colors.black;
Color secondaryColor = Colors.blue;

//* HOMEPAGE
const Color lightRed = Color.fromARGB(255, 255, 90, 79);
const Color lightYellow = Color.fromARGB(255, 255, 184, 78);
const Color lightBlue = Color.fromARGB(255, 74, 174, 255);
const Color lightGreen = Color.fromARGB(255, 130, 227, 130);

//* GRADIENTS
const LinearGradient bgGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 231, 231, 231),
    Color.fromARGB(255, 255, 255, 255),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient buttonGradient = LinearGradient(
  colors: [
    Color(0xff232526),
    Color(0xff414345),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
