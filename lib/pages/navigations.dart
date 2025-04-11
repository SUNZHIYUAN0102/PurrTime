import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purr_time/pages/charts.dart';
import 'package:purr_time/pages/home.dart';
import 'package:purr_time/pages/profile.dart';
import 'package:purr_time/pages/recipes.dart';

class Navigations extends StatefulWidget {
  const Navigations({super.key});

  @override
  State<Navigations> createState() => _NavigationsState();
}

class _NavigationsState extends State<Navigations> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Home(),
    const Charts(),
    const Recipes(),
    const Profile(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _selectedIndex, children: _pages),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              width: 375.w,
              height: 100.h,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  width: 320.w,
                  height: 70.h,
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _onItemTapped(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.reorder,
                              color:
                                  _selectedIndex == 0
                                      ? Colors.white
                                      : Colors.grey[600],
                            ),
                            Text(
                              "Main",
                              style: TextStyle(
                                color:
                                    _selectedIndex == 0
                                        ? Colors.white
                                        : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.leaderboard,
                              color:
                                  _selectedIndex == 1
                                      ? Colors.white
                                      : Colors.grey[600],
                            ),
                            Text(
                              "Charts",
                              style: TextStyle(
                                color:
                                    _selectedIndex == 1
                                        ? Colors.white
                                        : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              color:
                                  _selectedIndex == 2
                                      ? Colors.white
                                      : Colors.grey[600],
                            ),
                            Text(
                              "Recipes",
                              style: TextStyle(
                                color:
                                    _selectedIndex == 2
                                        ? Colors.white
                                        : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(3);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.pets_outlined,
                              color:
                                  _selectedIndex == 3
                                      ? Colors.white
                                      : Colors.grey[600],
                            ),
                            Text(
                              "My Pets",
                              style: TextStyle(
                                color:
                                    _selectedIndex == 3
                                        ? Colors.white
                                        : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
