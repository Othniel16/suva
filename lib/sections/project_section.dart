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
          bool isMobile = sizingInformation.isMobile;
          return Row(
            children: [
              isMobile
                  ? Container()
                  : const Expanded(flex: 2, child: SectionHeader('Projects')),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: isMobile ? 0 : size.width * 0.08,
                    right: isMobile ? 0 : size.width * 0.08,
                    top: isMobile ? 20.0 : size.height * 0.2,
                    bottom: isMobile ? size.height * 0.13 : size.height * 0.2,
                  ),
                  child: const DelayedDisplay(
                    child: ProjectList(),
                    slidingBeginOffset: Offset(0, 0),
                    delay: Duration(milliseconds: 1300),
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
