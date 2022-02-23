import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:suva/exports.dart';

class FreeStyle extends StatefulWidget {
  const FreeStyle({Key? key}) : super(key: key);

  @override
  State<FreeStyle> createState() => _FreeStyleState();
}

class _FreeStyleState extends State<FreeStyle> {
  static var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var rightList = list.getRange(list.length ~/ 2, list.length).toList();
  var leftList = List.generate(list.length ~/ 2, (i) => list[i]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
              child: Column(
                children: List.generate(
                  leftList.length,
                  (index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        ProjectCard(),
                        SizedBox(width: 100),
                        Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: ProjectCard(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
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
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  final PageController pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() => hovering = true);
        pageController.previousPage(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      onExit: (event) {
        setState(() => hovering = false);
        pageController.nextPage(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      child: Container(
        width: Get.width * 0.27,
        height: Get.height * 0.9,
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              right: hovering ? -36 : 0,
              bottom: hovering ? -24 : 0,
              child: AnimatedContainer(
                width: Get.width * 0.27,
                height: Get.height * 0.9,
                duration: const Duration(milliseconds: 100),
                color: hovering ? Palette.green : Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 30.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello World',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: Fonts.euclidCircularB,
                            ),
                          ),
                          hovering
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: DelayedDisplay(
                                    child: Text(
                                      'mobile app',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                        fontFamily: Fonts.euclidCircularB,
                                      ),
                                    ),
                                    slidingBeginOffset: Offset(0, 0),
                                    delay: Duration(milliseconds: 200),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: AnimatedContainer(
                        height: hovering ? Get.width * 0.07 : 0,
                        duration: const Duration(milliseconds: 100),
                        child: Marquee(
                          text: 'Some sample text that takes some space.',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Fonts.urbanist,
                                  ),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          velocity: 50.0,
                          blankSpace: 20.0,
                          startPadding: 10.0,
                          accelerationCurve: Curves.linear,
                          decelerationCurve: Curves.easeOut,
                          decelerationDuration: const Duration(milliseconds: 0),
                          accelerationDuration: const Duration(milliseconds: 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -40,
              left: -40,
              child: Container(
                width: Get.width * 0.27,
                height: Get.height * 0.9,
                color: Colors.white,
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Image.asset(
                      Images.signUpRestaurant,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      Images.signUpRestaurant,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
