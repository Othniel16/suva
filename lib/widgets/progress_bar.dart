import 'package:flutter/material.dart';
import 'package:splash_tap/splash_tap.dart';
import 'package:suva/exports.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return controller.isAnimating
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  bool isMobile = sizingInformation.isMobile;
                  return SizedBox(
                    width: isMobile ? size.width * 0.4 : size.width * 0.15,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(20.0),
                        right: Radius.circular(20.0),
                      ),
                      child: LinearProgressIndicator(
                        minHeight: 4.0,
                        value: controller.value,
                        color: Colors.white,
                        backgroundColor: Colors.grey[600],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : DelayedDisplay(
            slidingBeginOffset: const Offset(0, 0),
            fadingDuration: const Duration(milliseconds: 500),
            child: Splash(
              splashColor: ThemeProvider.themeOf(context).id == 'knight'
                  ? Colors.white
                  : Colors.black,
              onTap: () {},
              child: const Dock(),
              minRadius: 30.0,
              maxRadius: 60.0,
            ),
          );
  }
}
