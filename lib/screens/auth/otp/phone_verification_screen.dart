import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salong/screens/auth/otp/otp_confirmation.dart';
import 'package:salong/utils/strings.dart';

class PhoneVerificationScreen extends StatefulWidget {

  final String phoneNumber;

  const PhoneVerificationScreen({Key? key, this.phoneNumber = ""}) : super(key: key);

  @override
  _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {

  TextEditingController mobileController = TextEditingController();
  String? _phoneNumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneNumber = widget.phoneNumber;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CustomColor.primaryColor,
      body: Stack(
        children: [

          verificationWidget(context)
        ],
      ),
    );
  }

  Widget verificationWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: OtpConfirmation(
              title: Strings.otpVerification,
              image: 'assets/images/success.png',
              subTitle: Strings.enterOtpSentTo,
              phoneNumber: '+'+_phoneNumber!,
              otpLength: 4,
              validateOtp: validateOtp,
              routeCallback: moveToNextScreen,
              titleColor: Colors.white,
              themeColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  // ignore: missing_return
  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      moveToNextScreen(context);
      Fluttertoast.showToast(msg: Strings.successfullyVerified, backgroundColor: Colors.green);
      //return "OTP is Successfully Verified";
    } else {
      Fluttertoast.showToast(msg: Strings.wrongOtp, backgroundColor: Colors.red);
    }
    return "";
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    /*Navigator.push(context, MaterialPageRoute(
        builder: (context) => DrawerScreen()));*/
  }

}
