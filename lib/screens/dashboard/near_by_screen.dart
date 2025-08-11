import 'package:flutter/material.dart';
import 'package:salong/widgets/custom_google_map.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/data/near_by.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius *
                  2), topRight: Radius.circular(Dimensions.radius * 2))
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomGoogleMap.map,
              headerWidget(context),
              nearByWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Positioned(
      top: -65,
      left: 0,
      right: 0,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: TextFormField(
              style: CustomStyle.textStyle,
              controller: searchController,
              validator: (value){
                if(value!.isEmpty){
                  return Strings.salonServicesBarber;
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: Strings.salonServicesBarber,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                focusedBorder: CustomStyle.focusBorder,
                enabledBorder: CustomStyle.focusErrorBorder,
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
                filled: true,
                fillColor: CustomColor.secondaryColor,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.7),
                  size: Dimensions.heightSize * 2,
                ),
                hintStyle: CustomStyle.textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  nearByWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 260,
        width: MediaQuery.of(context).size.width,
        color: CustomColor.secondaryColor,
        child: ListView.builder(
          itemCount: NearByList.list().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            NearBy nearby = NearByList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                top: Dimensions.heightSize * 2,
                bottom: Dimensions.heightSize * 2,
              ),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius), topRight:
                            Radius.circular(Dimensions.radius)),
                            child: Image.asset(
                              nearby.image,
                              height: 150,
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 10,
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: CustomColor.primaryColor,
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        nearby.rating,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.smallTextSize,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: Dimensions.widthSize * 0.5,),
                                Container(
                                  height: 25,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: CustomColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  child: Center(
                                    child: Text(
                                      nearby.status,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.smallTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize),
                    Column(
                      children: [
                        Text(
                          nearby.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.largeTextSize,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: Dimensions.heightSize * 0.5,),
                        Text(
                          nearby.location,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.defaultTextSize,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
