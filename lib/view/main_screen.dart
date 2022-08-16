import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/fake_data.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    double bodyMargin = wi / 10;

    var textTheme = Theme.of(context).textTheme;

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
            homeScreen(
                he: he, wi: wi, textTheme: textTheme, bodyMargin: bodyMargin),
            Positioned(
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
                        gradient: const LinearGradient(
                            colors: GradiantColors.bottomNav),
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Assets.icons.home.image(),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Assets.icons.write.image()),
                        IconButton(
                            onPressed: () {}, icon: Assets.icons.user.image())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
