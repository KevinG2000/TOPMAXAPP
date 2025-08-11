import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/widgets/custom_google_map.dart';

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          aboutWidget(context),
          SizedBox(height: Dimensions.heightSize,),
          faqWidget(context),
          directionWidget(context),
          SizedBox(height: Dimensions.heightSize + 50),
        ],
      ),
    );
  }

  aboutWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Choose Us',
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Text(
          'Contrary to popular belief, Lorem Ipsum is nosimplyrandom text. It has roots in a piece of classical Latin literature 45 BC, making it over 2000 years old',
          style: CustomStyle.textStyle,
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Strings.bullet,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize * 2,
                  color: CustomColor.accentColor
              ),
            ),
            SizedBox(width: Dimensions.heightSize,),
            Expanded(
              child: Text(
                'Distracted by the readable content of a page when looking at its layout',
                style: CustomStyle.textStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Strings.bullet,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize * 2,
                  color: CustomColor.accentColor
              ),
            ),
            SizedBox(width: Dimensions.heightSize,),
            Expanded(
              child: Text(
                'Distracted by the readable content of a page when looking at its layout',
                style: CustomStyle.textStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize,),
        Text(
          'Our Mission and Vision',
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Text(
          'Contrary to popular belief, Lorem Ipsum is nosimplyrandom text. It has roots in a piece of classical Latin literature 45 BC, making it over 2000 years old',
          style: CustomStyle.textStyle,
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Strings.bullet,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize * 2,
                  color: CustomColor.accentColor
              ),
            ),
            SizedBox(width: Dimensions.heightSize,),
            Expanded(
              child: Text(
                'Distracted by the readable content of a page when looking at its layout',
                style: CustomStyle.textStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Strings.bullet,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize * 2,
                  color: CustomColor.accentColor
              ),
            ),
            SizedBox(width: Dimensions.heightSize,),
            Expanded(
              child: Text(
                'Distracted by the readable content of a page when looking at its layout',
                style: CustomStyle.textStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  faqWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQ',
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsetsDirectional.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Card(
                  elevation: 1,
                  child: ExpansionTile(
                    backgroundColor: CustomColor.secondaryColor,
                    collapsedBackgroundColor: CustomColor.secondaryColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '0${(index+1).toString()}. ',
                          style: CustomStyle.textStyle,
                        ),
                        Expanded(
                          child: Text(
                            'Rorem Ipsum is nosimplyrandom text',
                            style: CustomStyle.textStyle,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.marginSize,
                            right: Dimensions.marginSize,
                            bottom: Dimensions.heightSize
                        ),
                        child:  ListTile(
                          title: Text(
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ',
                            style: CustomStyle.textStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }

  directionWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.salonDestination,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Container(
          height: 150.0,
          child: CustomGoogleMap.map,
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: CustomColor.accentColor,
            ),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
              '58 Street18c - al dulha 3, London - United USA',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7)
              ),
            )
          ],
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          children: [
            Icon(
              Icons.bus_alert,
              color: CustomColor.accentColor,
            ),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
              '10 min By Bus without traffic',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7)
              ),
            )
          ],
        ),
      ],
    );
  }
}
