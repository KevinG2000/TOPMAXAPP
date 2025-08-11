import 'package:flutter/material.dart';
import 'package:salong/screens/auth/sign_in_screen.dart';
import 'package:salong/screens/dashboard_screen.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/colors.dart';

import 'otp/otp_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

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
                    bottom: Dimensions.heightSize * 2,
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

  bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 250,
            ),
            child: Text(
              Strings.createAnAccount,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          inputFieldWidget(context),
          termsConditionWidget(context),
          SizedBox(height: Dimensions.heightSize),
          buttonWidget(context),
          SizedBox(height: Dimensions.heightSize * 2,),
          alreadyHaveAnAccountWidget(context)
        ],
      ),
    );
  }

  inputFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(Strings.email),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoEmail,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: CustomColor.secondaryColor,
                  hintStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  prefixIcon: Icon(
                      Icons.mail,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              _title(Strings.password),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: CustomColor.secondaryColor,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                      Icons.lock,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                      Icons.visibility_off,
                      color: Colors.white.withOpacity(0.7),
                    )
                        : Icon(
                      Icons.visibility,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              _title(Strings.confirmPassword),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: confirmPasswordController,
                validator: (value){
                  if(value!.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                  filled: true,
                  fillColor: CustomColor.secondaryColor,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                      Icons.visibility_off,
                      color: Colors.white.withOpacity(0.7),
                    )
                        : Icon(
                      Icons.visibility,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
            ],
          ),
        )
    );
  }

  termsConditionWidget(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white.withOpacity(0.7)),
      child: CheckboxListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By clicking sign up you agree to the following ",
              style: CustomStyle.textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.blueColor,
                        decoration: TextDecoration.underline
                    ),
                  ),
                  onTap: () {
                    print('go to privacy url');
                    _showTermsConditions();
                  },
                ),
              ],
            ),
          ],
        ),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
          ),
          child: Center(
            child: Text(
              Strings.signUp.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()));
        },
      ),
    );
  }

  alreadyHaveAnAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.alreadyHaveAnAccount,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.signIn.toUpperCase(),
            style: TextStyle(
                color: CustomColor.accentColor,
                fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                SignInScreen()));
          },
        )
      ],
    );
  }

  _title(String value) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize,
        bottom: Dimensions.heightSize * 0.5
      ),
      child: Text(
        value,
        style: TextStyle(
            color: Colors.white
        ),
      ),
    );
  }

  Future<bool> _showTermsConditions() async {
    return (await showDialog(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomColor.primaryColor,
        child: Stack(
          children: [
            Positioned(
                top: -35.0,
                left: -50.0,
                child: Image.asset(
                    'assets/images/splash_logo.png'
                )
            ),
            Positioned(
                right: -35.0,
                bottom: -20.0,
                child: Image.asset(
                    'assets/images/splash_logo.png'
                )
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 2,
                  bottom: Dimensions.defaultPaddingSize * 2
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AlertDialog(
                    content: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 45,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  Strings.ourPolicyTerms,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'simply random text. It has roots in a piece of classical Latin literature ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'Distracted by the readable content of a page when looking at its layout.',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'Available, but the majority have suffered alteration',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  'When do we contact information ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  'Do we use cookies ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.secondaryColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.decline,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(width: 10.0,),
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.primaryColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.agree,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    )) ?? false;
  }

}
