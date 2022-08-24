import 'package:flutter/material.dart';

import '../component/my_colors.dart';
import '../component/my_strings.dart';
import '../gen/assets.gen.dart';
import '../model/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.he,
    required this.wi,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final double he;
  final double wi;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            //poster
            HomePagePoster(wi: wi, he: he, textTheme: textTheme),
            SizedBox(
              height: he * .025,
            ),

            HomePageTagList(
                he: he, bodyMargin: bodyMargin, wi: wi, textTheme: textTheme),
            SizedBox(height: he * .05),
            SeemoreBlog(
                bodyMargin: bodyMargin, he: he, wi: wi, textTheme: textTheme),
            HomePageBlogList(
                he: he, bodyMargin: bodyMargin, wi: wi, textTheme: textTheme),
            SizedBox(height: he * .05),
            SeemorePodcast(
                bodyMargin: bodyMargin, he: he, wi: wi, textTheme: textTheme),
            HomePagePodcastList(he: he, bodyMargin: bodyMargin, wi: wi),

            SizedBox(
              height: he * .08,
            )
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.he,
    required this.bodyMargin,
    required this.wi,
  }) : super(key: key);

  final double he;
  final double bodyMargin;
  final double wi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he / 3.5,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //podcast item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: he / 5.3,
                      width: wi / 2.4,
                      child: Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: wi / 2.4,
                      child: Text(
                        blogList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ))
                ],
              ),
            );
          })),
    );
  }
}

class SeemorePodcast extends StatelessWidget {
  const SeemorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.he,
    required this.wi,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final double he;
  final double wi;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: he * .03),
      child: Row(
        children: [
          Assets.icons.microphon
              .image(width: wi * .05, color: SolidColors.seeMore),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.he,
    required this.bodyMargin,
    required this.wi,
    required this.textTheme,
  }) : super(key: key);

  final double he;
  final double bodyMargin;
  final double wi;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he / 3.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: (context, index) {
          //blog item
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: he / 5.3,
                    width: wi / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                  colors: GradiantColors.blogPost,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(blogList[index].writer,
                                  style: textTheme.subtitle1),
                              Row(
                                children: [
                                  Text(blogList[index].views,
                                      style: textTheme.subtitle1),
                                  SizedBox(width: wi * .01),
                                  Icon(Icons.remove_red_eye,
                                      color: const Color.fromARGB(
                                          200, 255, 255, 255),
                                      size: he * .02),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: wi / 2.4,
                      child: Text(
                        blogList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeemoreBlog extends StatelessWidget {
  const SeemoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.he,
    required this.wi,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final double he;
  final double wi;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: he * .03),
      child: Row(
        children: [
          Assets.icons.bluePen
              .image(width: wi * .05, color: SolidColors.seeMore),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.he,
    required this.bodyMargin,
    required this.wi,
    required this.textTheme,
  }) : super(key: key);

  final double he;
  final double bodyMargin;
  final double wi;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he * .08,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: Container(
                height: he * .08,
                // width: wi * .09,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                        colors: GradiantColors.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      Assets.icons.hashtagicon
                          .image(color: Colors.white, width: wi * .05),
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
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.wi,
    required this.he,
    required this.textTheme,
  }) : super(key: key);

  final double wi;
  final double he;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
              width: wi / 1.25,
              height: he / 4.2,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(homePagePosterMap["imageAsset"]),
                      fit: BoxFit.cover)),
              foregroundDecoration: BoxDecoration(
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
                          color: const Color.fromARGB(200, 255, 255, 255),
                          size: he * .02),
                    ],
                  ),
                ],
              ),
              Text("دوازده قدم برنامه نویسی یک دوره ی...",
                  style: textTheme.headline1),
            ],
          ),
        )
      ],
    );
  }
}
