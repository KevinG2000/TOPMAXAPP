import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salong/widgets/back_widget.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/widgets/my_rating.dart';

class BarberDetailsScreen extends StatefulWidget {
  final String image, name, specialist, rating, reviews;

  const BarberDetailsScreen({Key? key, this.image = "", this.name = "", this.specialist = "", this.rating = "", this.reviews = ""}) : super(key: key);
  @override
  _BarberDetailsScreenState createState() => _BarberDetailsScreenState();
}

class _BarberDetailsScreenState extends State<BarberDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                          'assets/images/bg.png',
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                      BackWidget(name: Strings.barberDetails,),
                      Positioned(
                        bottom: -40,
                        left: 0,
                        right: 0,
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              widget.image,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                profileWidget(context),
                aboutDetailsWidget(context),
                orderAllRatingWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60
      ),
      child: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          Text(
            widget.specialist,
            style: CustomStyle.textStyle,
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRating(rating: widget.rating,),
              SizedBox(width: Dimensions.widthSize * 0.5,),
              Text(
                widget.rating,
                style: CustomStyle.textStyle,
              ),
              SizedBox(width: Dimensions.widthSize * 0.5,),
              Text(
                '(${widget.reviews})',
                style: CustomStyle.textStyle,
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Container(
            height: 40.0,
            width: 120,
            decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Text(
                Strings.bookNow,
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  aboutDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.about,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 0.5),
            Text(
              Strings.subTitle1,
              style: CustomStyle.textStyle,
            ),
            SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.openingHours,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 0.5),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Mon - Wed',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '8:00 am - 12:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.heightSize * 0.5),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Fri - Sat',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '10:00 am - 11:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.address,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 0.5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: CustomColor.accentColor,
                      ),
                      Text(
                        '58 Street- al dulha london - USA',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions,
                        color: CustomColor.accentColor,
                      ),
                      Text(
                        '5 KM',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  orderAllRatingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize,
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '4.5',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.extraLargeTextSize * 2
                ),
              ),
              SizedBox(width: Dimensions.heightSize,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Rating',
                    style: CustomStyle.defaultStyle,
                  ),
                  Row(
                    children: [
                      MyRating(rating: '5',),
                      SizedBox(width: Dimensions.heightSize,),
                      Text(
                        'Excellent',
                        style: CustomStyle.textStyle,
                      ),
                      Text(
                        '(25)',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Environment',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Services',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Price',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 4,),
        ],
      ),
    );
  }
}
