import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final bool isDesktop = sizingInformation.isDesktop;
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
          child: SizedBox(
            width: isDesktop ? Get.width * 0.27 : Get.width,
            height: isDesktop ? Get.height * 0.85 : Get.height * 0.75,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 000),
              padding: EdgeInsets.symmetric(horizontal:  hovering ? 0 : 00),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 150),
                    right: hovering ? -30 : 0,
                    bottom: hovering ? -30 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      color: hovering ? Palette.green : Colors.black,
                      width: isDesktop ? Get.width * 0.27 : Get.width * 0.95,
                      height: isDesktop ? Get.height * 0.85 : Get.height * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 20.0,
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
                              color: Colors.yellow,
                              height: hovering
                                  ? isDesktop
                                      ? Get.width * 0.07
                                      : Get.height * 0.13
                                  : 0,
                              duration: const Duration(milliseconds: 100),
                              child: Marquee(
                                text: 'Some sample text that takes some space.',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: Fonts.urbanist,
                                    ),
                                scrollAxis: Axis.horizontal,
                                velocity: 50.0,
                                blankSpace: 20.0,
                                startPadding: 10.0,
                                accelerationCurve: Curves.linear,
                                decelerationCurve: Curves.easeOut,
                                crossAxisAlignment: isDesktop
                                    ? CrossAxisAlignment.center
                                    : CrossAxisAlignment.start,
                                decelerationDuration:
                                    const Duration(milliseconds: 0),
                                accelerationDuration:
                                    const Duration(milliseconds: 0),
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
                      color: Colors.white,
                      width: isDesktop ? Get.width * 0.27 : Get.width * 0.95,
                      height: isDesktop ? Get.height * 0.85 : Get.height * 0.75,
                      child: PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Image.asset(Images.signUpRestaurant, fit: BoxFit.cover),
                          Image.asset(Images.signUpRestaurant, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
