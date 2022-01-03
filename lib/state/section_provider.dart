import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class SectionProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  int selectedSection = 0;

  final List<Widget> sections = const [
    Home(),
    AboutSection(),
    ProjectSection(),
    ContactSection(),
  ];

  set changeSection(int index) {
    selectedSection = index;
    notifyListeners();
  }
}
