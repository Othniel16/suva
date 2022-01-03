import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> sections = const [
    HeroSection(),
    AboutSection(),
    ProjectSection(),
    ContactSection(),
  ];

  final TextStyle _textStyle = const TextStyle(
    fontSize: 60.0,
    letterSpacing: 2.0,
    fontFamily: 'AbrilFatface',
  );

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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                DateTime.now().year.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Urbanist',
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                height: 80.0,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AnimatedTextKit(
                  repeatForever: true,
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
                    FadeAnimatedText('محفظة عثنييل أوشر',
                        textStyle: _textStyle),
                  ],
                ),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
