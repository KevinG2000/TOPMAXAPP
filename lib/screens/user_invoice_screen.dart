import 'package:flutter/material.dart';
import 'package:salong/widgets/back_widget.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/screens/service_summery_screen.dart';

class UserInvoiceScreen extends StatefulWidget {
  @override
  _UserInvoiceScreenState createState() => _UserInvoiceScreenState();
}

class _UserInvoiceScreenState extends State<UserInvoiceScreen> {
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
                BackWidget(name: Strings.userInvoice,),
                Image.asset(
                  'assets/images/home_bg.png',
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                bodyWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Image.asset(
              'assets/images/qrcode.png',
              height: 200.0,
            ),
          ),
        ),
        invoiceDetailsWidget(context),
        SizedBox(height: Dimensions.heightSize * 3),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
              ),
              child: Center(
                child: Text(
                  Strings.goToPayment.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ServiceSummeryScreen()));
            },
          ),
        ),
      ],
    );
  }

  invoiceDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions
          .marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      Strings.demoName,
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Phone',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      Strings.demoPhoneNumber,
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
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
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer ID',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '4589G',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Beauty Expertist',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      'Thisha Khan',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
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
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '22 Dec, 2021',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Time',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      'Today 3.00 PM',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
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
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discount',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '\$15 Off',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Amount',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '\$250',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
