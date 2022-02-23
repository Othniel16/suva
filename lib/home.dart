import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> sections = const [
    AboutSection(),
    ProjectSection(),
    ContactSection(),
  ];

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
                'A.D. ${DateTime.now().year}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: Fonts.urbanist,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  bool isMobile = sizingInformation.isMobile;
                  final TextStyle _textStyle = TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: Fonts.abrilFatface,
                    fontSize: isMobile ? 30.0 : 60.0,
                  );
                  final TextAlign _textAlign =
                      isMobile ? TextAlign.center : TextAlign.start;
                  return Container(
                    height: 80.0,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        isMobile
                            ? FadeAnimatedText(
                                'Portfolio, OTHNIEL USSHER',
                                textStyle: _textStyle,
                                textAlign: _textAlign,
                              )
                            : FadeAnimatedText(
                                'Portfolio,\nOTHNIEL USSHER',
                                textStyle: _textStyle,
                              ),
                        isMobile
                            ? FadeAnimatedText(
                                'Le portefeuille\nd\'OTHNIEL USSHER',
                                textStyle: _textStyle,
                                textAlign: _textAlign,
                              )
                            : FadeAnimatedText(
                                'Le portefeuille d\'OTHNIEL USSHER',
                                textStyle: _textStyle),
                        isMobile
                            ? FadeAnimatedText(
                                'Cartera de\nOTHNIEL USSHER',
                                textStyle: _textStyle,
                                textAlign: _textAlign,
                              )
                            : FadeAnimatedText('Cartera de OTHNIEL USSHER',
                                textStyle: _textStyle),
                        isMobile
                            ? FadeAnimatedText(
                                'OTHNIEL USSHER\n的投資組合',
                                textStyle: _textStyle,
                                textAlign: _textAlign,
                              )
                            : FadeAnimatedText('OTHNIEL USSHER 的投資組合',
                                textStyle: _textStyle),
                        isMobile
                            ? FadeAnimatedText(
                                'Портфолио Отниэля\nАшера',
                                textStyle: _textStyle,
                                textAlign: _textAlign,
                              )
                            : FadeAnimatedText('Портфолио Отниэля Ашера',
                                textStyle: _textStyle),
                        FadeAnimatedText('محفظة عثنييل أوشر',
                            textStyle: _textStyle),
                      ],
                    ),
                  );
                },
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
