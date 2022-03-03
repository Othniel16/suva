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
                alignment: Alignment.center,
                width: Get.width,
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
                                const ProjectCard(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: isDesktop ? 200 : 0),
                                  child: const ProjectCard(),
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
