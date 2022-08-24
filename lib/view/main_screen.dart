import 'package:flutter/material.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

import 'home_screen.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    double bodyMargin = wi / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Assets.images.logo.image(height: he / 13.6),
              const Icon(Icons.search, color: Colors.black)
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      he: he,
                      wi: wi,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin),
                  RegisterIntro(),
                  ProfileScreen(
                      he: he,
                      wi: wi,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin)
                ],
              ),
            ),
            BottomNavigation(
              bodyMargin: bodyMargin,
              he: he,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.bodyMargin,
    required this.he,
    required this.changeScreen,
  }) : super(key: key);

  final double bodyMargin;
  final double he;
  final Function(int) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomNavBackgroand,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: he / 8,
            decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: GradiantColors.bottomNav),
                borderRadius: BorderRadius.circular(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: Assets.icons.home.image(),
                ),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: Assets.icons.write.image()),
                IconButton(
                    onPressed: () => changeScreen(2),
                    icon: Assets.icons.user.image())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
