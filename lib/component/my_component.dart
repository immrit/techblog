import 'package:flutter/material.dart';
// import '../models/fake_data.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';
import '../model/fake_data.dart';
import 'my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.wi,
  }) : super(key: key);

  final double wi;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      thickness: .5,
      indent: wi / 6,
      endIndent: wi / 6,
    );
  }
}

// class MainTags extends StatelessWidget {
//   MainTags({
//     Key? key,
//     required this.textTheme,
//     required this.index,
//   }) : super(key: key);

//   final TextTheme textTheme;
//   var index;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(24)),
//         gradient: LinearGradient(
//             colors: GradiantColors.tags,
//             begin: Alignment.centerRight,
//             end: Alignment.centerLeft),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
//         child: Row(
//           children: [
//             ImageIcon(
//               Assets.icons.hashtagicon,
//               color: Colors.white,
//               size: 16,
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             Text(
//               tagList[index].title,
//               style: textTheme.headline2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// myLaunchUrl(String url) async {
//   var uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     log("could not launch ${uri.toString()}");
//   }
// }

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.he,
    required this.wi,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final double he;
  final double wi;
  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
