import 'package:suva/exports.dart';
import 'package:flutter/material.dart';

class FreeStyle extends StatefulWidget {
  const FreeStyle({Key? key}) : super(key: key);

  @override
  State<FreeStyle> createState() => _FreeStyleState();
}

class _FreeStyleState extends State<FreeStyle> {
  static var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var leftList = List.generate(list.length ~/ 2, (i) => list[i]);
  var rightList = list.getRange(list.length ~/ 2, list.length).toList();

  List<Color> leftColors = [
    Palette.red,
    Palette.yellow,
    Palette.hotPink,
    Palette.blue,
    Palette.purple,
  ];

  List<Color> rightColors = [
    Palette.green,
    Palette.purple,
    Palette.brown,
    Palette.pink,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final bool isDesktop = sizingInformation.isDesktop;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: Get.height * 0.2),
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          leftList.length,
                          (index) {
                            return Wrap(
                              direction:
                                  isDesktop ? Axis.horizontal : Axis.vertical,
                              spacing: 200,
                              runSpacing: 200,
                              children: [
                                ProjectCard(hoverColor: leftColors[index]),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: isDesktop ? 200 : 0),
                                  child: ProjectCard(
                                    hoverColor: rightColors[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // header
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: Get.height * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Portfolio'.toUpperCase(),
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.black,
                            fontFamily: Fonts.euclidCircularB,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
