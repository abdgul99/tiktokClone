import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/utils/icons.dart';

import 'screens/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _navCurrentIndex = 0;
  late final AnimationController animationController;
  double animationValue = 0.0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    animationController.repeat();
    animationController.addListener(() {
      setState(() {
        animationValue = animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _navCurrentIndex,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              onTap: (index) {
                setState(() {
                  _navCurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SvgPicture.asset(Kicons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Discover',
                  icon: SvgPicture.asset(Kicons.searchIcon),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(Kicons.mainButton),
                ),
                BottomNavigationBarItem(
                  label: 'Inbox',
                  icon: SvgPicture.asset(Kicons.chat),
                ),
                BottomNavigationBarItem(
                  label: 'Me',
                  icon: SvgPicture.asset(Kicons.me),
                )
              ]),
        ),
      ),
      body: const HomePage(),
    );
  }
}
