import 'package:flutter/material.dart';

class CustomPadding {
  EdgeInsets get lowPadding => EdgeInsets.all(8);
  EdgeInsets get paddingAll => EdgeInsets.all(16);

  EdgeInsets horizontalPadding(double value) => EdgeInsets.symmetric(horizontal: value);
  EdgeInsets verticalPadding(double value) => EdgeInsets.symmetric(vertical: value);
}
