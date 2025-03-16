import 'package:flutter/material.dart';
import 'package:property_app/style/colors/app_colors.dart';
import 'package:property_app/view/page/activity_page.dart';
import 'package:property_app/view/page/home_page.dart';
import 'package:property_app/view/page/inbox_page.dart';
import 'package:property_app/view/page/profile_page.dart';

class PropertyHomeScreen extends StatefulWidget {
  const PropertyHomeScreen({super.key});

  @override
  State<PropertyHomeScreen> createState() => _PropertyHomeScreenState();
}

class _PropertyHomeScreenState extends State<PropertyHomeScreen> {
  List<Widget> pages = <Widget>[
    HomePage(),
    InboxPage(),
    ActivityPage(),
    ProfilePage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: AppColors().white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors().black,
              ),
              label: 'Home',
              backgroundColor: AppColors().background,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.inbox,
                  color: AppColors().black,
                ),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_activity,
                  color: AppColors().black,
                ),
                label: 'Activity'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: AppColors().black,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
