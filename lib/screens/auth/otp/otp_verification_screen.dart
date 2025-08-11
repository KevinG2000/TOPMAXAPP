import 'package:flutter/material.dart';
import 'package:salong/screens/auth/otp/phone_verification_screen.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';

import '../../components/country.dart';
import '../../components/flutter_country_picker.dart';

class OTPVerificationScreen extends StatefulWidget {

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  String selectedCounty = 'United States';
  late Country _selected;
  TextEditingController mobileController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mobileController.text = '1';

  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
            width: width,
            height: height,
            child:Stack(
              children: [
                Positioned(
                  top: -50,
                  left: - Dimensions.marginSize,
                  right: - Dimensions.marginSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular((width / 2) + Dimensions.marginSize),
                      bottomRight: Radius.circular((width / 2) + Dimensions.marginSize),
                    ),
                    child: Image.asset(
                      'assets/images/header_bg.png',
                      fit: BoxFit.fill,
                      height: height * 0.4,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  bottom: Dimensions.heightSize,
                  right: Dimensions.marginSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular((width / 2) + Dimensions.marginSize),
                      bottomRight: Radius.circular((width / 2) + Dimensions.marginSize),
                    ),
                    child: Image.asset(
                      'assets/images/chair.png',
                      fit: BoxFit.fill,
                      height: 120,
                      width: 120 ,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize * 1.5,
                    right: Dimensions.marginSize * 1.5,
                  ),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius * 2),
                          topRight: Radius.circular(Dimensions.radius * 2),
                        )
                    ),
                    child: bodyWidget(context),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Strings.otpVerification,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.extraLargeTextSize * 1.5
          ),
        ),
        SizedBox(height: Dimensions.heightSize * 2,),
        Text(
          Strings.enterMobileNumber,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: Dimensions.smallTextSize
          ),
        ),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
              width: 60.0,
              child: CountryPicker(
                dense: false,
                showFlag: true,  //displays flag, true by default
                showDialingCode: false, //displays dialing code, false by default
                showName: false, //displays country name, true by default
                showCurrency: false, //eg. 'British pound'
                showCurrencyISO: false, //eg. 'GBP'
                onChanged: (Country country) {
                  setState(() {
                    _selected = country;
                    selectedCounty = _selected.name;
                    mobileController.text = _selected.dialingCode;
                  });
                },
                selectedCountry: _selected,
                nameTextStyle: CustomStyle.textStyle,
              ),
            ),
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width/1.5,
              child: TextFormField(
                style: CustomStyle.textStyle,
                controller: mobileController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.phone,
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
          ],
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        GestureDetector(
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColor.accentColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Center(
              child: Text(
                Strings.sendOTP.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            PhoneVerificationScreen(phoneNumber: mobileController.text,)));
          },
        ),
      ],
    );
  }
}
