import 'package:amzone/constants/global_variables.dart';
import 'package:amzone/features/auth/screens/account_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/services/home.dart';

class BottomBar extends StatefulWidget {
  static const String routName = '/bottom-bar';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
        child: Text(
      "Carts",
      style: TextStyle(color: Colors.black, fontSize: 30),
    ))
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: Color.fromARGB(255, 249, 252, 255),
        iconSize: 28,
        elevation: 0,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color:
                    _page == 0 ? Colors.blue : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color:
                    _page == 1 ? Colors.blue : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),

          // for this one we will use a third party library to handle the cart the
          // library name is badge watch from 3:32:29
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color:
                    _page == 2 ? Colors.blue : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.card_travel_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
