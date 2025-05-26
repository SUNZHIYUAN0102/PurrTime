import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purr_time/pages/navigations/activities/activities.dart';
import 'package:purr_time/pages/navigations/charts/charts.dart';
import 'package:purr_time/pages/navigations/home.dart';
import 'package:purr_time/pages/navigations/myPets.dart';
import 'package:purr_time/store/token.dart';
import 'package:purr_time/store/user.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Navigations extends StatefulWidget {
  const Navigations({super.key});

  @override
  State<Navigations> createState() => _NavigationsState();
}

class _NavigationsState extends State<Navigations> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Widget> _pages;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _pages = [
        Home(scaffoldKey: _scaffoldKey),
        const Charts(),
        const Activities(),
        const MyPets(),
      ];
    });

    FlutterNativeSplash.remove(); // remove the splash screen
  }

  _handleSignOut() {
    TokenController.to.clearToken();
    Get.offAllNamed("/welcome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: StylishBottomBar(
        currentIndex: _selectedIndex,
        elevation: 20.h,
        items: [
          BottomBarItem(
            icon: const Icon(Icons.reorder),
            title: const Text('Main'),
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: const Icon(Icons.pie_chart_outline_outlined),
            title: const Text('Charts'),
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: const Icon(Icons.list_alt_outlined),
            title: const Text('Activities'),
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: const Icon(Icons.pets_outlined),
            title: const Text('My Pets'),
            selectedColor: Colors.black,
          ),
        ],
        option: DotBarOptions(
          iconSize: 26.sp,
          padding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 70.h),
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                      image: DecorationImage(
                        image: NetworkImage(
                          UserController.to.user.value!.avatar!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Hi, ${UserController.to.user.value!.username}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(height: 1.h, color: Colors.grey[200]),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                "About us",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Sign out",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              onTap: _handleSignOut,
            ),
          ],
        ),
      ),
    );
  }
}
