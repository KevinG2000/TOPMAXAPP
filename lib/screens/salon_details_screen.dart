import 'package:flutter/material.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/widgets/back_widget.dart';
import 'package:salong/widgets/my_rating.dart';
import 'package:salong/widgets/details/about_widget.dart';
import 'package:salong/widgets/details/service_widget.dart';
import 'package:salong/widgets/details/gallery_widget.dart';
import 'package:salong/widgets/details/review_widget.dart';


class SalonDetailsScreen extends StatefulWidget {
  final String name, image, location, rating;

  const SalonDetailsScreen({Key? key, this.name = "", this.image = "", this.location = "", this.rating = ""}) : super(key: key);

  @override
  _SalonDetailsScreenState createState() => _SalonDetailsScreenState();
}

class _SalonDetailsScreenState extends State<SalonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                headerWidget(context),
                detailsWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          Image.asset(
            widget.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.5),
            colorBlendMode: BlendMode.softLight,
          ),
          BackWidget(name: Strings.salonDetails,),
          Positioned(
            bottom: Dimensions.heightSize * 2,
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.extraLargeTextSize
                  ),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRating(rating: widget.rating,),
                    Container(
                      height: 30.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Center(
                        child: Text(
                          Strings.bookNow,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.defaultTextSize
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  detailsWidget(BuildContext context) {
    int totalPages = 4;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          color: Colors.white,
          child: PageView.builder(
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 0 ? CustomColor.accentColor : Colors.black,
                                  child: Center(
                                    child: Text(
                                      Strings.about,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 1 ? CustomColor.accentColor : Colors.black,
                                  child: Center(
                                    child: Text(
                                      Strings.service,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 2 ? CustomColor.accentColor : Colors.black,
                                  child: Center(
                                    child: Text(
                                      Strings.gallery,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 3 ? CustomColor.accentColor : Colors.black,
                                  child: Center(
                                    child: Text(
                                      Strings.review,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: CustomColor.primaryColor,
                          width: MediaQuery.of(context).size.width,
                          child: pageViewWidget(index),
                        )
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  pageViewWidget(int i) {
    switch(i) {
      case 0 :
        return AboutWidget();
      case 1 :
        return ServiceWidget();
      case 2 :
        return GalleryWidget();
      case 3 :
        return ReviewWidget();
      default :
        return AboutWidget();
    }
  }
}
