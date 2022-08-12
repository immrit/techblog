import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/fake_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Assets.images.logo.image(height: he / 13.6),
                const Icon(Icons.search)
              ],
            ),
            SizedBox(height: he * .02),
            Stack(
              children: [
                Center(
                  child: Container(
                      width: wi / 1.25,
                      height: he / 4.2,
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image:
                                  AssetImage(homePagePosterMap["imageAsset"]),
                              fit: BoxFit.cover)),
                      foregroundDecoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                              colors: GradiantColors.homePosterCoverGradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter))),
                ),
                Positioned(
                  bottom: he * .02,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              homePagePosterMap["writer"] +
                                  " - " +
                                  homePagePosterMap["date"],
                              style: textTheme.subtitle1),
                          Row(
                            children: [
                              Text(homePagePosterMap["view"],
                                  style: textTheme.subtitle1),
                              SizedBox(width: wi * .01),
                              Icon(Icons.remove_red_eye,
                                  color:
                                      const Color.fromARGB(200, 255, 255, 255),
                                  size: he * .02),
                            ],
                          ),
                        ],
                      ),
                      Text("دوازده قدم برنامه نویسی یک دوره ی....س",
                          style: textTheme.headline1),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: he * .08,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: he * .08,
                        // width: wi * .09,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                                colors: GradiantColors.tags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Assets.icons.hashtagicon.image(),
                              SizedBox(width: wi * .02),
                              Text(
                                tagList[index].title,
                                style: textTheme.headline1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
