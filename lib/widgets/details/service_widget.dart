import 'package:flutter/material.dart';

import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/data/best_service.dart';
import 'package:salong/data/offers.dart';

class ServiceWidget extends StatefulWidget {
  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return detailsWidget(context);
  }
  detailsWidget(BuildContext context) {
    int totalPages = 2;
    return Column(
      children: [
        SizedBox(height: Dimensions.heightSize * 2,),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                color: CustomColor.primaryColor,
                child: Center(
                  child: Text(
                    Strings.services,
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
                color: CustomColor.primaryColor,
                child: Center(
                  child: Text(
                    Strings.offers,
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 4,
                                color: index == 0 ? CustomColor.accentColor : Colors.black,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 4,
                                color: index == 1 ? CustomColor.accentColor : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
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

  pageViewWidget(int index) {
    switch(index){
      case 0 :
        return servicesWidget(context);
      case 1:
        return offersWidget(context);
    }
  }

  servicesWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.primaryColor,
      child: ListView.builder(
        itemCount: BestServiceList.list().length,
          itemBuilder: (context, index) {
            BestService services = BestServiceList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions
                  .marginSize, bottom: Dimensions.heightSize),
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
                              '${services.status} Types',
                              style: CustomStyle.textStyle
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: Dimensions.widthSize),
                        child: Container(
                          height: 28,
                          width: 70,
                          decoration: BoxDecoration(
                              color: CustomColor.accentColor,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Center(
                            child: Text(
                              Strings.book,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
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
    );
  }

  offersWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.primaryColor,
      child: ListView.builder(
          itemCount: OffersList.list().length,
          reverse: true,
          itemBuilder: (context, index) {
            Offers offers = OffersList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions
                  .marginSize, bottom: Dimensions.heightSize),
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
                        offers.image,
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
                              offers.name,
                              style: TextStyle(
                                  fontSize: Dimensions.largeTextSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5,),
                            Row(
                              children: [
                                Text(
                                    '${offers.discount}% Off ',
                                    style: CustomStyle.textStyle,
                                ),
                                Text(
                                    '\$${offers.oldPrice} ',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.white.withOpacity(0.7)
                                    ),
                                ),
                                Text(
                                    '\$${offers.newPrice}',
                                    style: CustomStyle.textStyle
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: Dimensions.widthSize),
                        child: Container(
                          height: 28,
                          width: 70,
                          decoration: BoxDecoration(
                              color: CustomColor.accentColor,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Center(
                            child: Text(
                              Strings.book,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
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
    );
  }
}
