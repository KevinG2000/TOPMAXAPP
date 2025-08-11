import 'package:flutter/material.dart';
import 'package:salong/screens/dashboard_screen.dart';
import 'package:salong/widgets/back_widget.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/widgets/my_rating.dart';
import 'package:salong/screens/dashboard/messaging_screen.dart';
import 'package:salong/class/url_launcher.dart';

class ConfirmRequestScreen extends StatefulWidget {
  final String image, name, specialist, rating, reviews;

  const ConfirmRequestScreen({Key? key, this.image = "", this.name = "", this.specialist = "", this.rating = "", this.reviews = ""}) : super(key: key);
  @override
  _ConfirmRequestScreenState createState() => _ConfirmRequestScreenState();
}

class _ConfirmRequestScreenState extends State<ConfirmRequestScreen> {

  TextEditingController commentController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool isFinish = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BackWidget(name: Strings.confirmRequest,),
              Image.asset(
                'assets/images/home_bg.png',
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Column(
                children: [
                  isFinish ? Text(
                    Strings.beautyExpert,
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize * 1.2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  )
                    : Text(
                    Strings.weHaveCompletedYourService,
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize * 1.2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimensions.heightSize,),
                  profileWidget(context),
                  SizedBox(height: Dimensions.heightSize * 2,),
                  dateTimeWidget(context),
                  SizedBox(height: Dimensions.heightSize,),
                  amountWidget(context),
                  SizedBox(height: Dimensions.heightSize,),
                  isFinish ? Container() : giveYourRatingWidget(context),
                  SizedBox(height: 100),
                ],
              ),
              isFinish ? finishButtonWidget(context)
                  : doneButtonWidget(context),
            ],
          ),
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
            widget.image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              onTap: () {
                UrlLauncher.url(Strings.callingNumber);
              },
            ),
            SizedBox(width: Dimensions.widthSize),
            GestureDetector(
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(
                  Icons.messenger,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    MessagingScreen(
                      image: widget.image,
                      name: widget.name,
                      specialist: widget.specialist,
                    )));
              },
            ),
          ],
        ),
      ],
    );
  }

  dateTimeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.dateTime,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  Strings.date,
                  style: CustomStyle.textStyle
              ),
              Text(
                  '25 August 2021',
                  style: CustomStyle.textStyle
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  Strings.time,
                  style: CustomStyle.textStyle
              ),
              Text(
                  '08:00 pm',
                  style: CustomStyle.textStyle
              ),
            ],
          ),
        ],
      ),
    );
  }

  amountWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.amount,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.service,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    Text(
                      'Style Hair Cut',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      'Spa',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      'Skin Treatment',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.quantity,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.price,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    Text(
                      '\$25',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      '\$100',
                      style: CustomStyle.textStyle,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      '\$80',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.subTotal,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$205',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.discountByCoupon,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$10',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Divider(color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.total,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$195 ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  giveYourRatingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.giveYourRating,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      Strings.behaviour,
                      style: CustomStyle.textStyle
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  MyRating(rating: '5',)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      Strings.behaviour,
                      style: CustomStyle.textStyle
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  MyRating(rating: '5',)
                ],
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      Strings.price,
                      style: CustomStyle.textStyle
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  MyRating(rating: '5',)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      Strings.skill,
                      style: CustomStyle.textStyle
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  MyRating(rating: '5',)
                ],
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Text(
            Strings.yourComment,
            style: TextStyle(
                color: Colors.black,
              fontSize: Dimensions.extraLargeTextSize
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          TextFormField(
            style: CustomStyle.textStyle,
            controller: commentController,
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if(value!.isEmpty){
                return Strings.pleaseFillOutTheField;
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: Strings.demoComment,
              contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              labelStyle: CustomStyle.textStyle,
              filled: true,
              fillColor: CustomColor.secondaryColor,
              hintStyle: CustomStyle.textStyle,
              focusedBorder: CustomStyle.focusBorder,
              enabledBorder: CustomStyle.focusErrorBorder,
              focusedErrorBorder: CustomStyle.focusErrorBorder,
              errorBorder: CustomStyle.focusErrorBorder,

            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Text(
            '${Strings.addTip} ${widget.name}',
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: Dimensions.buttonHeight,
                width: 100,
                child: TextFormField(
                  style: CustomStyle.textStyle,
                  controller: amountController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return Strings.pleaseFillOutTheField;
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: Strings.amount,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: CustomColor.secondaryColor,
                    hintStyle: CustomStyle.textStyle,
                    focusedBorder: CustomStyle.focusBorder,
                    enabledBorder: CustomStyle.focusErrorBorder,
                    focusedErrorBorder: CustomStyle.focusErrorBorder,
                    errorBorder: CustomStyle.focusErrorBorder,

                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 2)
                    ),
                    child: Center(
                      child: Text(
                        '\$5',
                        style: TextStyle(
                          fontSize: Dimensions.largeTextSize * 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '5';
                    });
                  },
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 2)
                    ),
                    child: Center(
                      child: Text(
                        '\$10',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 1.5,
                            fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '10';
                    });
                  },
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 2)
                    ),
                    child: Center(
                      child: Text(
                        '\$15',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 1.5,
                            fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '15';
                    });
                  },
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius * 2)
                    ),
                    child: Center(
                      child: Text(
                        '\$20',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 1.5,
                            fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '20';
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  finishButtonWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2))
          ),
          child: Center(
            child: Text(
              Strings.finish.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isFinish = false;
            // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
          });
        },
      ),
    );
  }

  doneButtonWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2))
          ),
          child: Center(
            child: Text(
              Strings.done.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            // isFinish = true;
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
          });
        },
      ),
    );
  }

}
