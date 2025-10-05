import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:salong/screens/dashboard/appointment_screen.dart';
import 'package:salong/screens/dashboard/messaging_screen.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/utils/strings.dart';
import 'package:salong/screens/dashboard/home_screen.dart';
import 'package:salong/screens/dashboard/near_by_screen.dart';
import 'package:salong/screens/dashboard/profile_screen.dart';

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  Color? logoColor;

  var iconData = <IconData>[
    Icons.home,
    Icons.location_on,
    Icons.apps_outlined,
    Icons.message,
    Icons.person,
  ];

  var badges = <int>[0, 0, 0, 0, 0];

  var iconText = <Widget>[
    Text(
        Strings.home,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 12
        )
    ),
    Text(
        Strings.nearby,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 12
        )
    ),
    Text(
        Strings.appointment,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 12
        )
    ),
    Text(
        Strings.inbox,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 12
        )
    ),
    Text(
        Strings.profile,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 12
        )
    ),
  ];

  var indicatorColors = <Color>[
    CustomColor.accentColor,
    CustomColor.accentColor,
    CustomColor.accentColor,
    CustomColor.accentColor,
    CustomColor.accentColor,
  ];

  // List<Widget> get badgeWidgets => indexed(badges).map((Indexed indexed) => indexed.value != null
  //     ? Text(indexed.value.toString(),
  //     style: TextStyle(
  //       color: indexed.index == activeIndex
  //           ? indicatorColors[indexed.index]
  //           : Colors.white,
  //     )) : null).toList();

  @override
  void initState() {
    logoColor = Colors.red[600];
    _selectedIndex = 0;
    super.initState();
  }


  // ignore: unused_element
  // _onAnimate(AnimationUpdate update) {
  //   setState(() {
  //     logoColor = update.color;
  //   });
  // }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: goToScreen(_selectedIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: CustomColor.accentColor,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              label: "Workout",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_add_outlined),
              label: "Tracking",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.redeem),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).iconTheme.color,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  goToScreen(int activeIndex) {
    switch(activeIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return NearbyScreen();
      case 2:
        return AppointmentScreen();
      case 3:
        return MessagingScreen(
          image: 'assets/images/profile.png',
          name: Strings.demoName,
          specialist: 'Expert',
        );
      case 4:
        return ProfileScreen(
          image: 'assets/images/profile.png',
        );
    }
  }
}
