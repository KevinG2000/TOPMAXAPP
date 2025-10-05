import 'package:flutter/material.dart';
import 'package:salong/data/popular_category.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/dimensions.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/utils/custom_style.dart';
import 'package:salong/data/best_service.dart';
import 'package:salong/data/near_by.dart';
import 'package:salong/data/barber.dart';
import 'package:salong/screens/auth/sign_in_screen.dart';
import 'package:salong/screens/salon_details_screen.dart';
import 'package:salong/screens/barber_details_screen.dart';
import 'package:salong/screens/notification_screen.dart';
import 'package:salong/screens/dashboard/profile_screen.dart';
import 'package:salong/screens/filter_screen.dart';

import '../add_new_card_screen.dart';
import 'appointment_screen.dart';
import 'package:salong/screens/dashboard/add_new_tracking_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomColor.primaryColor,
      drawer: Drawer(
        child: Container(
          color: CustomColor.primaryColor,
          child: Column(
            //portant: Remove any padding from the ListView.
            //padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: profileWidget(context),
                decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                ),
              ),
              listData('assets/images/icon/appointment.png', Strings.appointment, AppointmentScreen()),
              listData('assets/images/icon/payment.png', Strings.payment, AddNewCardScreen()),
              listData('assets/images/icon/notification.png', Strings.notification, NotificationScreen()),
              listData('assets/images/icon/settings.png', Strings.settings, ProfileScreen()),
              Spacer(),
              listData('assets/images/icon/sign_out.png', Strings.signOut, SignInScreen()),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.asset(
                        'assets/images/home_bg.png',
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    headerWidget(context),
                    searchWidget(context)
                  ],
                ),
              ),
              chooseBarberWidget(context),
              bestSalonServicesWidget(context),
              popularCategoryWidget(context),
              nearbySaloonWidget(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.accentColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YourExercisesScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Your Exercises',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  profileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 3,),
      child: ListTile(
        leading: Image.asset(
          'assets/images/profile.png',
        ),
        title: Text(
          Strings.demoName,
          style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          Strings.demoEmail,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ),
    );
  }

  listData(String icon, String title, Widget goTo) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 2
      ),
      child: ListTile(
        leading: Image.asset(
            icon
        ),
        title: Text(
          title,
          style: CustomStyle.listStyle,
        ),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          goTo));
        },
      ),
    );
  }

  searchWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize * 2,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: TextFormField(
        style: CustomStyle.textStyle,
        controller: searchController,
        keyboardType: TextInputType.text,
        validator: (value){
          if(value!.isEmpty){
            return Strings.pleaseFillOutTheField;
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: Strings.salonServicesBarber,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelStyle: CustomStyle.textStyle,
          filled: true,
          fillColor: CustomColor.secondaryColor,
          hintStyle: CustomStyle.textStyle,
          focusedBorder: CustomStyle.focusBorder,
          enabledBorder: CustomStyle.focusErrorBorder,
          focusedErrorBorder: CustomStyle.focusErrorBorder,
          errorBorder: CustomStyle.focusErrorBorder,
          suffixIcon: IconButton(
            icon: Icon(
                Icons.search,
              color: Colors.white.withOpacity(0.7),
            ),
            onPressed: (){
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context)
                              => SearchResultScreen()));*/
            },
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right:
      Dimensions
          .marginSize * 0.5, top: Dimensions.heightSize * 2, bottom: Dimensions
          .heightSize * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.white,
            ),
            onPressed: () {
              if(scaffoldKey.currentState!.isDrawerOpen){
                scaffoldKey.currentState!.openEndDrawer();
              }else{
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
          IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterScreen()));
              }
          ),
        ],
      ),
    );
  }

  chooseBarberWidget(BuildContext context) {
    return Container(
      height: 180,
      color: CustomColor.secondaryColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Strings.chooseYourBarber),
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

  bestSalonServicesWidget(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Strings.bestSalonServices),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: BestServiceList.list().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  BestService service = BestServiceList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: Dimensions.widthSize * 2),
                    child: GestureDetector(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              width: 180,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(Dimensions.radius),
                                    child: Image.asset(
                                      service.image,
                                      height: 150,
                                      width: 180,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 25.0,
                                    left: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: CustomColor.accentColor,
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
                                                service.rating,
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
                                              service.status,
                                              style: TextStyle(
                                                  color: Colors.white,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize * 0.5,),
                                Text(
                                  service.location,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.defaultTextSize,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonDetailsScreen(
                          name: service.name,
                          image: service.image,
                          location: service.location,
                          rating: service.rating,
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

  popularCategoryWidget(BuildContext context) {
    return Container(
      height: 240,
      color: CustomColor.secondaryColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Strings.popularCategories),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: PopularCategoryList.list().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  PopularCategory popularCategory = PopularCategoryList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: Dimensions.widthSize * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radius),
                          child: Image.asset(
                            popularCategory.image,
                            height: 130,
                            width: 150,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              popularCategory.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize * 0.5,),
                            Text(
                              '${popularCategory.places} Places',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.defaultTextSize,
                              ),
                            ),
                          ],
                        )
                      ],
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

  nearbySaloonWidget(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Strings.nearbySalon),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: NearByList.list().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  NearBy nearby = NearByList.list()[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: Dimensions.widthSize * 2),
                    child: Container(
                      height: 150,
                      width: 180,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radius),
                            child: Image.asset(
                              nearby.image,
                              height: 150,
                              width: 180,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 10,
                            top: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: CustomColor.accentColor,
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
                                              color: Colors.white,
                                              fontSize: Dimensions.smallTextSize,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nearby.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.largeTextSize,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.heightSize * 0.5,),
                                    Text(
                                      nearby.location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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

  _title(String value) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
        top: Dimensions.heightSize,
        bottom: Dimensions.heightSize * 0.5,
      ),
      child: Text(
        value,
        style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.extraLargeTextSize,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

}
