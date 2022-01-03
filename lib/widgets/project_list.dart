import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final List<ProjectInfo> projectInfos = [
    ProjectInfo('Alicante', 'Mobile App', '2021', Palette.blue),
    ProjectInfo('Le Havre', 'Website', '2021', Palette.red),
    ProjectInfo('Delhi', 'Mobile App', '2021', Palette.brown),
    ProjectInfo('Monte Carlo', 'Website', '2021', Palette.blue),
    ProjectInfo('Dar es Salaam', 'Mobile App', '2019', Palette.brown),
    ProjectInfo('Milan', 'Mobile App', '2021', Palette.blue),
    ProjectInfo('Mumbai', 'Mobile App', '2021', Palette.red),
    ProjectInfo('Comcent', 'Mobile App', '2021', Palette.blue),
    ProjectInfo('Dortmund', 'Website', '2021', Palette.brown),
    ProjectInfo('Kinshasa', 'Mobile App', '2018', Palette.red),
  ];

  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      itemCount: projectInfos.length,
      itemBuilder: (context, index) {
        ProjectInfo info = projectInfos[index];
        return HoverDetector(
          transform: true,
          builder: (isHover) {
            return ProjectBox(
              index: index + 1,
              type: info.type,
              name: info.name,
              year: info.year,
              color: info.color,
            );
          },
        );
      },
    );
  }
}

class ProjectInfo {
  final String name, type, year;
  final Color color;

  ProjectInfo(this.name, this.type, this.year, this.color);
}
