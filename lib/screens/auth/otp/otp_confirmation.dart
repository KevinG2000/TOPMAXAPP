import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/dimensions.dart';

// ignore: must_be_immutable
class OtpConfirmation extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  final String phoneNumber;
  final Future<String> Function(String) validateOtp;
  final void Function(BuildContext) routeCallback;
  Color? topColor;
  Color? bottomColor;
  bool? _isGradientApplied;
  final Color? titleColor;
  final Color? themeColor;
  final Color? keyboardBackgroundColor;
  final Widget? icon;

  /// default [otpLength] is 4
  final int otpLength;

  OtpConfirmation({
    Key? key,
    this.title = "Verification Code",
    this.subTitle = "please enter the OTP sent to your\n device",
    this.otpLength = 4,
    required this.validateOtp,
    required this.routeCallback,
    this.themeColor = Colors.white,
    this.titleColor = Colors.white,
    this.icon,
    this.keyboardBackgroundColor, this.image = "", this.phoneNumber = "",
  }) : super(key: key) {
    this._isGradientApplied = false;
  }

  OtpConfirmation.withGradientBackground(
      {Key? key,
        this.title = "Verification Code",
        this.subTitle = "please enter the OTP sent to your\n device",
        this.otpLength = 4,
        required this.validateOtp,
        required this.routeCallback,
        this.themeColor = Colors.white,
        this.titleColor = Colors.white,
        required this.topColor,
        required this.bottomColor,
        this.keyboardBackgroundColor,
        this.icon, this.image = "", this.phoneNumber = ""})
      : super(key: key) {
    this._isGradientApplied = true;
  }

  @override
  _OtpConfirmationState createState() => new _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation>
    with SingleTickerProviderStateMixin {
  late Size _screenSize;
  late int _currentDigit;
  List<int> otpValues = [];
  bool showLoadingButton = false;

  @override
  void initState() {
    otpValues = List<int>.filled(widget.otpLength, 0, growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        height: MediaQuery.of(context).size.height,
        decoration: widget._isGradientApplied!
            ? BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.topColor!, widget.bottomColor!],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0, 1],
              tileMode: TileMode.clamp,
            ))
            : BoxDecoration(color: CustomColor.primaryColor),
        width: _screenSize.width,
        child: _getInputPart,
      ),
    );
  }

  /// Return Title label
  get _getTitleText {
    return new Text(
      widget.title,
      style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.extraLargeTextSize * 1.5
      ),
    );
  }

  /// Return subTitle label
  get _getSubtitleText {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.subTitle,
          style: CustomStyle.textStyle,
        ),
        Text(
            widget.phoneNumber,
            style: CustomStyle.textStyle
        ),
      ],
    );
  }

  /// Return "OTP" input fields
  get _getInputField {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getOtpTextWidgetList(),
    );
  }

  /// Returns otp fields of length [widget.otpLength]
  List<Widget> getOtpTextWidgetList() {
    // ignore: deprecated_member_use
    List<Widget> optList = [];
    for (int i = 0; i < widget.otpLength; i++) {
      optList.add(_otpTextField(otpValues[i]));
    }
    return optList;
  }

  /// Returns Otp screen views
  get _getInputPart {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget.icon != null
            ? IconButton(
          icon: widget.icon ?? Icon(Icons.add),
          iconSize: 60,
          onPressed: () {},
        )
            : Container(
          width: 0,
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _getTitleText,
        ),
        Image.asset(
          widget.image,
          height: 120.0,
          width: 120,
          fit: BoxFit.contain,
        ),
        SizedBox(height: Dimensions.heightSize,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _getSubtitleText,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _getInputField,
        ),
        showLoadingButton
            ? Center(child: CircularProgressIndicator())
            : Container(
          width: 0,
          height: 0,
        ),
        _getOtpKeyboard
      ],
    );
  }

  /// Returns "Otp" keyboard
  get _getOtpKeyboard {
    return new Container(
        color: widget.keyboardBackgroundColor,
        height: _screenSize.width - 100,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  _otpKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  _otpKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "4",
                    onPressed: () {
                      _setCurrentDigit(4);
                    }),
                _otpKeyboardInputButton(
                    label: "5",
                    onPressed: () {
                      _setCurrentDigit(5);
                    }),
                _otpKeyboardInputButton(
                    label: "6",
                    onPressed: () {
                      _setCurrentDigit(6);
                    }),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "7",
                    onPressed: () {
                      _setCurrentDigit(7);
                    }),
                _otpKeyboardInputButton(
                    label: "8",
                    onPressed: () {
                      _setCurrentDigit(8);
                    }),
                _otpKeyboardInputButton(
                    label: "9",
                    onPressed: () {
                      _setCurrentDigit(9);
                    }),
              ],
            ),
            Flexible(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: new Icon(
                        Icons.backspace,
                        color: widget.themeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = widget.otpLength - 1; i >= 0; i--) {
                            if (otpValues[i] != null) {
                              otpValues[i];
                              break;
                            }
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Returns "Otp text field"
  Widget _otpTextField(int digit) {
    return new Container(
      width: 45.0,
      height: 45.0,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: widget.titleColor,
        ),
      ),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)
      ),
    );
  }

  /// Returns "Otp keyboard input Button"
  Widget _otpKeyboardInputButton({String? label, VoidCallback? onPressed}) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: onPressed,
        borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: new Center(
            child: new Text(
              label ?? "",
              style: new TextStyle(
                fontSize: 30.0,
                color: widget.themeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns "Otp keyboard action Button"
  _otpKeyboardActionButton({Widget? label, VoidCallback? onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }

  /// sets number into text fields n performs
  ///  validation after last number is entered
  void _setCurrentDigit(int i) async {
    setState(() {
      _currentDigit = i;
      int currentField;
      for (currentField = 0; currentField < widget.otpLength; currentField++) {
        if (otpValues[currentField] == null) {
          otpValues[currentField] = _currentDigit;
          break;
        }
      }
      if (currentField == widget.otpLength - 1) {
        showLoadingButton = true;
        String otp = otpValues.join();
        widget.validateOtp(otp).then((value) {
          showLoadingButton = false;
          if (value == null) {
            widget.routeCallback(context);
          } else if (value.isNotEmpty) {
            //showToast(context, value);
            clearOtp();
          }
        });
      }
    });
  }

  ///to clear otp when error occurs
  void clearOtp() {
    otpValues = List<int>.filled(widget.otpLength, 0, growable: false);
    setState(() {});
  }

  ///to show error  message
  /*showToast(BuildContext context, String msg) {
    Widget toast = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.grey.shade500,
          ),
          child: Center(
              child: Text(
                msg,
                maxLines: 3,
                textAlign: TextAlign.center,
              )),
        ));
    FlutterToast(context).showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }*/
}
