import 'package:flutter/material.dart';
import 'package:salong/screens/auth/sign_in_screen.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/colors.dart';
import 'data.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: PageView.builder(
          itemCount: totalPages,
            itemBuilder: (context, index){
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
              return Container(
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
                          oi.image,
                          fit: BoxFit.fill,
                          height: height * 0.4,
                          width: width,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.2,
                      right: -10,
                      left: -10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize * 1.5,
                          right: Dimensions.marginSize * 1.5,
                        ),
                        child: Container(
                          height: height * 0.4,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 2),
                              topRight: Radius.circular(Dimensions.radius * 2),
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize),
                                    child: Text(
                                      oi.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.extraLargeTextSize * 1.5,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.heightSize * 2,),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize),
                                    child: Text(
                                      oi.subTitle,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: Dimensions.defaultTextSize,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.heightSize * 4),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: index != (totalPages - 1) ? Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 12.0,
                                      child: ListView.builder(
                                        itemCount: totalPages,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, i){
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              width: index == i ? 20 : 20.0,
                                              decoration: BoxDecoration(
                                                  color: index == i ? CustomColor.accentColor :
                                                  Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                      : GestureDetector(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: CustomColor.accentColor,
                                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius
                                                * 0.5))
                                        ),
                                        child: Center(
                                          child: Text(
                                            Strings.getStarted.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.largeTextSize,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)
                                      => SignInScreen()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                          oi.subImage,
                          fit: BoxFit.fill,
                          height: 120,
                          width: 120 ,
                        ),
                      ),
                    ),
                  ],
                )
              );
            }),
      ),
    );
  }
}
