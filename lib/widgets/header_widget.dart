import 'package:flutter/material.dart';
import 'package:salong/utils/dimensions.dart';

class HeaderWidget extends StatefulWidget {
  final String name;

  const HeaderWidget({Key? key, this.name = ""}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
