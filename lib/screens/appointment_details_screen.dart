import 'package:flutter/material.dart';
import 'package:salong/widgets/back_widget.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/data/barber.dart';
import 'package:salong/screens/barber_details_screen.dart';
import 'package:salong/data/slot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salong/screens/user_invoice_screen.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  @override
  _AppointmentDetailsScreenState createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {

  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  List list = [];

  List<String> couponList = ['No Coupon', 'I have a coupon'];
  String selectedCoupon = "";
  TextEditingController couponController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCoupon = couponList[1].toString();
    print('coupon: '+selectedCoupon);
    getSlotList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWidget(name: Strings.appointmentDetails,),
              Image.asset(
                'assets/images/home_bg.png',
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Column(
                children: [
                  chooseBeautyExpertWidget(context),
                  selectDateWidget(context),
                  SizedBox(height: Dimensions.heightSize,),
                  selectTimeSlotWidget(context),
                  SizedBox(height: Dimensions.heightSize,),
                  serviceAmountWidget(context),
                  SizedBox(height: Dimensions.heightSize * 2),
                  nextButtonWidget(context),
                  SizedBox(height: Dimensions.heightSize * 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  chooseBeautyExpertWidget(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
              top: Dimensions.heightSize
            ),
            child: Text(
              Strings.chooseYourBarber,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: BarberList.list().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Barber barber = BarberList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: Dimensions.widthSize * 3),
                    child: GestureDetector(
                      child: Container(
                        height: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                barber.image,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize,),
                            Text(
                              barber.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BarberDetailsScreen(
                          image: barber.image,
                          name: barber.name,
                          specialist: barber.specialist,
                          rating: barber.rating,
                          reviews: barber.reviews,
                        )));
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  selectDateWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.selectDate,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
                height: 48.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                    border: Border.all(color: CustomColor.secondaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expDate,
                          style: CustomStyle.textStyle,
                        ),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white.withOpacity(0.7),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        expDate = "${selectedDate.toLocal()}".split(' ')[0];
        print('date: '+expDate);
      });
  }

  selectTimeSlotWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.selectTimeSlot,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.extraLargeTextSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.green
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize * 0.5,),
                    Text(
                      Strings.available,
                      style: TextStyle(
                        fontSize: Dimensions.smallTextSize,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: CustomColor.secondaryColor
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize * 0.5,),
                    Text(
                      Strings.booked,
                      style: TextStyle(
                        fontSize: Dimensions.smallTextSize,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimensions.heightSize),
            Container(
              height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 5,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(SlotList
                    .list()
                    .length, (index) {
                  Slot slot = SlotList.list()[index];
                  // ignore: deprecated_member_use
                  return FloatingActionButton(
                    //color: isSelected ? Colors.blue : Colors.red,
                    backgroundColor: Colors.black,
                    splashColor: Colors.blue.withOpacity(0.5),
                    child: Container(
                      // height: 50,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: slot.isAvailable ? list[index] ? Colors.green :
                          CustomColor.accentColor:
                          Colors.black,
                          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                      ),
                      child: Center(
                        child: Text(
                          '${slot.time}',
                          style: TextStyle(
                              fontSize: Dimensions.smallTextSize,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (!slot.isAvailable) {
                        print('already booked');
                        Fluttertoast.showToast(msg: Strings.slotIsNotAvailable,
                            backgroundColor: Colors.red, textColor: Colors.white);
                      } else {
                        setState(() {
                          list[index] = !list[index];
                        });
                        print('you can book this slot: ' + list.toString());
                      }
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getSlotList() {
    int data = SlotList.list().length;
    for(int i = 0; i < data; i++){
      Slot slot = SlotList.list()[i];
      list.add(slot.isAvailable);

      print('list: '+list.toString());
    }
  }

  serviceAmountWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.serviceAmount,
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
          Container(
            height: 50.0,
            //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
                border: Border.all(color: Colors.black.withOpacity(0.1))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                  .marginSize * 0.5),
              child: DropdownButton(
                isExpanded: true,
                dropdownColor: CustomColor.secondaryColor,
                underline: Container(),
                hint: Text(
                  selectedCoupon,
                  style: CustomStyle.textStyle,
                ), // Not necessary for Option 1
                value: selectedCoupon,
                onChanged: (newValue) {
                  setState(() {
                    selectedCoupon = newValue!;
                    print('value: '+selectedCoupon.toString());
                  });
                },
                items: couponList.map((value) {
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
          SizedBox(height: Dimensions.heightSize),
          selectedCoupon == 'I have a coupon' ? TextFormField(
            style: CustomStyle.textStyle,
            controller: couponController,
            keyboardType: TextInputType.text,
            validator: (value){
              if(value!.isEmpty){
                return Strings.pleaseFillOutTheField;
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: 'OFFER10',
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
          )
              : Container(),
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
                '\$195',
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

  nextButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              UserInvoiceScreen()));
        },
      ),
    );
  }
}
