import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
// import '../models/fake_data.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'my_colors.dart';

class techDivider extends StatelessWidget {
  const techDivider({
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
