import 'package:flutter/material.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/widgets/my_rating.dart';

class ProfileScreen extends StatefulWidget {
  final String image;

  const ProfileScreen({Key? key, this.image = ""}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.heightSize * 3),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  Strings.profile,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize * 1.2,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSize,),
            profileWidget(context),
            detailsWidget(context)
          ],
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'assets/images/profile.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Text(
          Strings.demoName,
          style: TextStyle(
              fontSize: Dimensions.extraLargeTextSize,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 0.5,),
        Text(
          'Spa & Skin Treatment',
          style: CustomStyle.textStyle,
        ),
        SizedBox(height: Dimensions.heightSize * 0.5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyRating(rating: '5',),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
              '5',
              style: CustomStyle.textStyle,
            ),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
              '(120)',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
      ],
    );
  }

  detailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                  .marginSize * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(width: Dimensions.widthSize,),
                      Text(
                        Strings.settings,
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                  .marginSize * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cut,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(width: Dimensions.widthSize,),
                      Text(
                        Strings.myServices,
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                    .marginSize * 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.money,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(width: Dimensions.widthSize,),
                        Text(
                          Strings.myCoupon,
                          style: TextStyle(
                              fontSize: Dimensions.largeTextSize,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {

            },
          ),
          SizedBox(height: Dimensions.heightSize),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                  .marginSize * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(width: Dimensions.widthSize,),
                      Text(
                        Strings.supportRequest,
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
