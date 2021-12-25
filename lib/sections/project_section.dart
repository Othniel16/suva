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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            const Expanded(flex: 2, child: SectionHeader('Projects')),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.1,
                ),
                child: const DelayedDisplay(
                  child: ProjectList(),
                  slidingBeginOffset: Offset(0, 0),
                  delay: Duration(milliseconds: 1300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
