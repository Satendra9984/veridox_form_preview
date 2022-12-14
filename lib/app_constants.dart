import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double kBRad = 13;
final kBorderRadius = BorderRadius.circular(kBRad);
const double kElevation = 25;

BoxDecoration containerElevationDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.grey.shade200,
  ),
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade400,
      offset: const Offset(0.0, 0.5), //(x,y)
      // blurRadius: 0.5,
    ),
  ],
);

/*
* form text input donw
* text done
* dropdown done
* date time
* toggle
* */
