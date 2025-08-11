import 'package:flutter/material.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: Dimensions.defaultTextSize
  );

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize
  );

  static var listStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.defaultTextSize,
  );

  static var defaultStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.largeTextSize
  );

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
    //borderSide: BorderSide(color: Colors.white),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
    //borderSide: BorderSide(color: Colors.white),
  );

  static var searchBox = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    borderSide: BorderSide(color: Colors.white),
  );
}