import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({Key? key}) : super(key: key);

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  late Size size;
  late SectionProvider sectionProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    sectionProvider = Provider.of<SectionProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isDesktop = sizingInformation.isDesktop;
          return Row(
            children: [
              isDesktop
                  ? const Expanded(flex: 2, child: SectionHeader('Projects'))
                  : Container(),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: isDesktop ? size.width * 0.08 : 20.0,
                    right: isDesktop ? size.width * 0.08 : 20.0,
                    top: isDesktop ? size.height * 0.2 : 20.0,
                    bottom: isDesktop ? size.height * 0.2 : size.height * 0.13,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isDesktop
                          ? Container()
                          : const Text(
                              'Projects',
                              style: TextStyle(color: Colors.black),
                            ),
                      const DelayedDisplay(
                        child: ProjectList(),
                        slidingBeginOffset: Offset(0, 0),
                        delay: Duration(milliseconds: 1300),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TestPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
