import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/my_cats.dart.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var he = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.tcbot.path, height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom, style: textTheme.headline4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, he, textTheme);
                  },
                  child: const Text("بزن بریم!")),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, double he, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: he / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourEmail,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: textTheme.headline4,
                        decoration: InputDecoration(
                            hintText: "techblog@gmail.com",
                            hintStyle: textTheme.headline5),
                        onChanged: ((value) {
                          isEmail(value);
                          print(value + "is Email" + isEmail(value).toString());
                        }),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);

                          _activeCodeBottomSheet(context, he, textTheme);
                        },
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<dynamic> _activeCodeBottomSheet(
      BuildContext context, double he, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: he / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activateCode,
                      style: textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: textTheme.headline4,
                        decoration: InputDecoration(
                            hintText: "techblog@gmail.com",
                            hintStyle: textTheme.headline5),
                        onChanged: ((value) {
                          isEmail(value);
                          print(value + "is Email" + isEmail(value).toString());
                        }),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MyCats()));
                        },
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
