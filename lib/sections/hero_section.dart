import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  late Size size;
  late SectionProvider sectionProvider;

  final TextStyle _textStyle = const TextStyle(
    fontFamily: 'AbrilFatface',
    fontSize: 60.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    sectionProvider = Provider.of<SectionProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            child: Container(
              height: 80.0,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedTextKit(
                pause: const Duration(milliseconds: 500),
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  FadeAnimatedText('Portfolio, OTHNIEL USSHER',
                      textStyle: _textStyle),
                  FadeAnimatedText('Le portefeuille d\'OTHNIEL USSHER',
                      textStyle: _textStyle),
                  FadeAnimatedText('Cartera de OTHNIEL USSHER',
                      textStyle: _textStyle),
                  FadeAnimatedText('OTHNIEL USSHER 的投資組合',
                      textStyle: _textStyle),
                  FadeAnimatedText('Портфолио Отниэля Ашера',
                      textStyle: _textStyle),
                  FadeAnimatedText('محفظة عثنييل أوشر', textStyle: _textStyle),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                DateTime.now().year.toString(),
                style: const TextStyle(
                  fontFamily: 'AbrilFatface',
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
