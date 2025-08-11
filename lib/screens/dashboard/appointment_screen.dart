import 'package:flutter/material.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/data/best_service.dart';
import 'package:salong/screens/appointment_details_screen.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

enum SingingCharacter { child, men, others}

class _AppointmentScreenState extends State<AppointmentScreen> {

  SingingCharacter _character = SingingCharacter.child;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/home_bg.png',
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.heightSize * 3),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        Strings.appointment,
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize,),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.marginSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.customerType,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimensions.marginSize, right: Dimensions.marginSize),
                          child: Container(
                            height: 20.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white
                                  ),
                                  child: Radio(
                                    value: SingingCharacter.child,
                                    toggleable: true,
                                    autofocus: true,
                                    groupValue: _character,
                                    activeColor: CustomColor.accentColor,
                                    onChanged: (value) {
                                      setState(() {
                                        _character = value!;
                                        index = 0;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  Strings.child,
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(width: Dimensions.widthSize,),
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white
                                  ),
                                  child: Radio(
                                    value: SingingCharacter.men,
                                    toggleable: true,
                                    autofocus: true,
                                    groupValue: _character,
                                    activeColor: CustomColor.accentColor,
                                    onChanged: ( value) {
                                      setState(() {
                                        _character = value!;
                                        index = 1;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  Strings.men,
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(width: Dimensions.widthSize,),
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white
                                  ),
                                  child: Radio(
                                    value: SingingCharacter.others,
                                    toggleable: true,
                                    autofocus: true,
                                    groupValue: _character,
                                    activeColor: CustomColor.accentColor,
                                    onChanged: ( value) {
                                      setState(() {
                                        _character = value!;
                                        index = 2;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  Strings.others,
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(width: Dimensions.widthSize,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize * 2,),
                  selectServiceWidget(context),
                ],
              ),
            ),
            nextButtonWidget(context)
          ],
        ),
      ),
    );
  }

  selectServiceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize),
          child: Text(
            Strings.selectServices,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: BestServiceList.list().length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                BestService services = BestServiceList.list()[index];
                String selectedService = services.serviceList![0].toString();
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    bottom: Dimensions.heightSize,),
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomColor.secondaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            services.image,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: Dimensions.widthSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  services.name,
                                  style: TextStyle(
                                      fontSize: Dimensions.largeTextSize,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize * 0.5,),
                                Text(
                                    '${services.service} Types',
                                    style: CustomStyle.textStyle
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
                                border: Border.all(color: Colors.black.withOpacity(0.1))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                                  .marginSize * 0.5),
                              child: DropdownButton(
                                isExpanded: true,
                                dropdownColor: CustomColor.primaryColor,
                                underline: Container(),
                                hint: Text(
                                  selectedService,
                                  style: CustomStyle.textStyle,
                                ), // Not necessary for Option 1
                                value: selectedService,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedService = newValue!;
                                    print('value: '+selectedService.toString());
                                  });
                                },
                                items: services.serviceList?.map((value) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      value,
                                      style: CustomStyle.textStyle,
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
  }

  nextButtonWidget(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
        child: GestureDetector(
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColor.accentColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius), topRight: Radius.circular(Dimensions.radius))
            ),
            child: Center(
              child: Text(
                Strings.next.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentDetailsScreen()));
          },
        ),
      ),
    );
  }
}
