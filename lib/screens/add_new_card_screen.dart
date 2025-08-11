import 'package:flutter/material.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/widgets/back_widget.dart';

class AddNewCardScreen extends StatefulWidget {
  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  List<String> typeList = ['Master Card', 'Visa Card', 'Credit Card'];
  String selectedCard = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCard = typeList[0].toString();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackWidget(name: Strings.addNewCard,),
                bodyWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.cardType,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
                        color: CustomColor.secondaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                          .marginSize * 0.5),
                      child: DropdownButton(
                        isExpanded: true,
                        dropdownColor: CustomColor.secondaryColor,
                        underline: Container(),
                        hint: Text(
                            selectedCard,
                          style: CustomStyle.textStyle,
                        ), // Not necessary for Option 1
                        value: selectedCard,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCard = newValue = "";
                          });
                        },
                        items: typeList.map((value) {
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
                  Text(
                    Strings.cardNumber,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: numberController,
                    validator: (value){
                      if(value!.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.demoCardNumber,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: CustomColor.secondaryColor,
                      hintStyle: CustomStyle.textStyle,
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  Text(
                    Strings.cardHolderName,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: nameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.demoHolderName,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: CustomColor.secondaryColor,
                      hintStyle: CustomStyle.textStyle,
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.expirationDate,
                              style: CustomStyle.textStyle,
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                  height: 48.0,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: CustomColor.secondaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        expDate,
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Dimensions.heightSize),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.cvv,
                              style: CustomStyle.textStyle,
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5),
                            TextFormField(
                              style: CustomStyle.textStyle,
                              controller: cvvController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return Strings.pleaseFillOutTheField;
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: '123',
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                labelStyle: CustomStyle.textStyle,
                                focusedBorder: CustomStyle.focusBorder,
                                enabledBorder: CustomStyle.focusErrorBorder,
                                focusedErrorBorder: CustomStyle.focusErrorBorder,
                                errorBorder: CustomStyle.focusErrorBorder,
                                filled: true,
                                fillColor: CustomColor.secondaryColor,
                                hintStyle: CustomStyle.textStyle,
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
              ),
              child: Center(
                child: Text(
                  Strings.saveCard.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {

            },
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
}
