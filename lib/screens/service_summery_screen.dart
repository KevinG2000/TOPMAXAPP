import 'package:flutter/material.dart';
import 'package:salong/widgets/back_widget.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/screens/add_new_card_screen.dart';
import 'package:salong/screens/confirm_request_screen.dart';

class ServiceSummeryScreen extends StatefulWidget {
  @override
  _ServiceSummeryScreenState createState() => _ServiceSummeryScreenState();
}

enum SingingCharacter { cash, card, mobileBanking}

class _ServiceSummeryScreenState extends State<ServiceSummeryScreen> {

  SingingCharacter _character = SingingCharacter.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            BackWidget(name: Strings.serviceSummery,),
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
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        dateTimeWidget(context),
        SizedBox(height: Dimensions.heightSize),
        amountWidget(context),
        SizedBox(height: Dimensions.heightSize),
        paymentWidget(context),
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
                  Strings.confirm.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {
              _showPaymentSuccessDialog();
            },
          ),
        ),
        SizedBox(height: Dimensions.heightSize),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
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
            },
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 3),
      ],
    );
  }

  dateTimeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.heightSize,),
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

  paymentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 3, left: Dimensions
          .marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                border: Border.all(color: CustomColor.secondaryColor),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: ListTile(
              title: Text(
                Strings.cash.toUpperCase(),
                style: CustomStyle.textStyle,
              ),
              leading: Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.white.withOpacity(0.7)
                ),
                child: Radio(
                  value: SingingCharacter.cash,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: ( value) {
                    setState(() {
                      _character = value!;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                border: Border.all(color: CustomColor.secondaryColor),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: ListTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/visa.png',
                    height: 30.0,
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  Image.asset(
                    'assets/images/credit_card.png',
                    height: 30.0,
                  ),
                ],
              ),
              leading: Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.white.withOpacity(0.7)
                ),
                child: Radio(
                  value: SingingCharacter.card,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: ( value) {
                    setState(() {
                      _character = value!;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
          ),
          _character.toString() == 'SingingCharacter.card'? Column(
            children: [
              SizedBox(height: Dimensions.heightSize,),
              Container(
                height: 120,
                color: CustomColor.secondaryColor,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/visa.png',
                            height: 100.0,
                            width: 150.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: Dimensions.widthSize,),
                          Image.asset(
                            'assets/images/credit_card.png',
                            height: 100.0,
                            width: 150.0,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: Dimensions.widthSize,),
                          GestureDetector(
                            child: Container(
                              height: 100.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                              ),
                              child: Center(
                                child: Text(
                                  '${Strings.addNewCard.toUpperCase()} + ',
                                  style: CustomStyle.textStyle,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  AddNewCardScreen()));
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ) : Container(),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                border: Border.all(color: CustomColor.secondaryColor),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: ListTile(
              title: Text(
                Strings.mobileBanking.toUpperCase(),
                style: CustomStyle.textStyle,
              ),
              leading: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.white.withOpacity(0.7)
                ),
                child: Radio(
                  value: SingingCharacter.mobileBanking,
                  toggleable : true,
                  autofocus : true,
                  groupValue: _character,
                  onChanged: ( value) {
                    setState(() {
                      _character = value!;
                      print('value: '+_character.toString());
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _showPaymentSuccessDialog() async {
    return (await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => new AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                  'assets/images/success.png',
                width: 70,
                height: 70,
              ),
              Text(
                Strings.successfullySendYourRequest,
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                child: Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                  ),
                  child: Center(
                    child: Text(
                      Strings.ok.toUpperCase(),
                      style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                      ConfirmRequestScreen(
                        image: 'assets/images/barber/1.png',
                        name: 'Jesika Sabrina',
                        specialist: 'Spa & Skin Specialist ',
                        rating: '5',
                        reviews: '150',
                      )));
                },
              )
            ],
          ),
        ),

      ),
    )) ?? false;
  }

}
