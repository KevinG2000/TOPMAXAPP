import 'dart:async';

import 'package:salong/screens/dashboard_screen.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/widgets/back_widget.dart';
import 'package:salong/widgets/filter_chip_widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  RangeValues _currentRangeValues = const RangeValues(0, 500);

  RangeValues _currentRangeValues2 = const RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            BackWidget(name: Strings.filterBy,),
            bodyWidget(context),
            buttonWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: <Widget>[
          _servicesWidget(context),
          SizedBox(height: Dimensions.heightSize,),
          _choosePriceWidget(context),
          SizedBox(height: Dimensions.heightSize,),
          _chooseDistanceWidget(context),
        ],
      ),
    );
  }

  _servicesWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(Strings.services),
        SizedBox(height: Dimensions.heightSize,),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Align
            (
            alignment: Alignment.centerLeft,
            child: Container(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    FilterChipWidget(chipName: 'Body Message'),
                    FilterChipWidget(chipName: 'Style Saving'),
                    FilterChipWidget(chipName: 'Hair Message'),
                    FilterChipWidget(chipName: 'Hair Cut'),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }

  _choosePriceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(Strings.choosePrice),
        SizedBox(height: Dimensions.heightSize,),
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 1000,
          divisions: 1000,
          activeColor: CustomColor.accentColor,
          inactiveColor: CustomColor.secondaryColor,
          labels: RangeLabels(
            '\$${_currentRangeValues.start.round().toString()}',
            '\$${_currentRangeValues.end.round().toString()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        )
      ],
    );
  }

  _chooseDistanceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(Strings.chooseDistance),
        SizedBox(height: Dimensions.heightSize,),
        RangeSlider(
          values: _currentRangeValues2,
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: CustomColor.accentColor,
          inactiveColor: CustomColor.secondaryColor,
          labels: RangeLabels(
            '${_currentRangeValues2.start.round().toString()} KM',
            '${_currentRangeValues2.end.round().toString()} KM',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues2 = values;
            });
          },
        )
      ],
    );
  }

  Widget _titleContainer(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.largeTextSize,
          fontWeight: FontWeight.bold
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.circular(Dimensions.radius)
          ),
          child: Center(
            child: Text(
              Strings.applyNow,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          openProgressingDialog(context);
          Timer(
              Duration(
                  seconds: 3
              ),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                  DashboardScreen()
              ))
          );
        },
      ),
    );
  }

  openProgressingDialog(BuildContext context){
    showGeneralDialog(
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.white.withOpacity(0.6),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      GestureDetector(
                        child: Container(
                          height: Dimensions.buttonHeight,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(Dimensions.radius)
                          ),
                          child: Center(
                            child: Text(
                              Strings.cancel.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                              DashboardScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
            Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }
}