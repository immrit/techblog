import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    double bodyMargin = wi / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(children: [
              DrawerHeader(child: Assets.images.logo.image(scale: 3)),
              ListTile(
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.headline4,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "درباره تک بلاگ",
                  style: textTheme.headline4,
                ),
              ),
              const Divider(
                 color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "اشتراک گذاری تک بلاگ",
                  style: textTheme.headline4,
                ),
                onTap: (() async {
                  await Share.share(MyStrings.shareText);
                }),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "تک بلاگ در گیت هاب",
                  style: textTheme.headline4,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: (() {
                    _key.currentState!.openDrawer();
                  }),
                  child: const Icon(Icons.menu, color: Colors.black)),
              Assets.images.logo.image(height: he / 13.6),
              const Icon(Icons.search, color: Colors.black)
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx((() => IndexedStack(
                      index: selectedPageIndex.value,
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
                    )))),
            BottomNavigation(
              bodyMargin: bodyMargin,
              he: he,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
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
      bottom: 8,
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
