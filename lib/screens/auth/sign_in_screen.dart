import 'package:flutter/material.dart';
import 'package:salong/dialog/forgot_password_dialog.dart';
import 'package:salong/screens/auth/sign_up_screen.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/screens/dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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

  bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 250
            ),
            child: Text(
              Strings.signInAccount,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          inputFieldWidget(context),
          rememberForgotWidget(context),
          buttonWidget(context),
          SizedBox(height: Dimensions.heightSize * 2,),
          newHereWidget(context)
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
              right: Dimensions.marginSize
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
            ],
          ),
        )
    );
  }

  rememberForgotWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
        bottom: Dimensions.heightSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Text(
              Strings.forgotPassword,
              style: CustomStyle.textStyle,
            ),
            onTap: () {
              MyDialog.forgotPassword(context);
            },
          ),
        ],
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
              Strings.signIn.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              DashboardScreen()));
        },
      ),
    );
  }

  newHereWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.ifYouHaveNoAccount,
          style: CustomStyle.textStyle,
        ),
        GestureDetector(
          child: Text(
            Strings.signUp.toUpperCase(),
            style: TextStyle(
                color: CustomColor.accentColor,
                fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                SignUpScreen()));
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

}
