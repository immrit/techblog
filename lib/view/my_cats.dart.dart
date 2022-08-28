import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/fake_data.dart';

import '../component/my_colors.dart';
import 'home_screen.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                SvgPicture.asset(Assets.images.tcbot.path, height: 100),
                const SizedBox(height: 16),
                Text(MyStrings.successfulRegistration,
                    style: textTheme.headline4),
                TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: textTheme.headline4)),
                const SizedBox(height: 16),
                Text(MyStrings.chooseCats, style: textTheme.headline4),

                //taglist
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  print("${tagList[index]}exist");
                                }
                              });
                            },
                            child: MainTags(
                                he: size.height,
                                wi: size.width,
                                textTheme: textTheme,
                                index: index),
                          );
                        }),
                  ),
                ),
                //
                SizedBox(height: 16),
                Assets.icons.downCatArrow.image(scale: 3),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 2,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return Container(
                            height: size.height * .08,
                            // width: wi * .09,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: SolidColors.surface),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(width: size.width * .02),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.headline4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags
                                            .remove(selectedTags[index]);
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
