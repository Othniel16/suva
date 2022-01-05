import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  final TextStyle _textStyle = const TextStyle(
    fontSize: 30.0,
    color: Colors.grey,
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w600,
  );

  late Animation animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(seconds: 200), vsync: this);
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  late Size size;
  late SectionProvider sectionProvider;
  late List<SvgPicture> assets;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    sectionProvider = Provider.of<SectionProvider>(context, listen: false);
    Color imageColor = ThemeProvider.themeOf(context).id == 'knight'
        ? Theme.of(context).canvasColor
        : Colors.black54;
    assets = [
      SvgPicture.asset(Svgs.dart, color: imageColor),
      SvgPicture.asset(Svgs.node, color: imageColor),
      SvgPicture.asset(Svgs.python, color: imageColor),
      SvgPicture.asset(Svgs.firebase, color: imageColor),
      SvgPicture.asset(Svgs.flutter, color: imageColor),
      SvgPicture.asset(Svgs.git, color: imageColor),
      SvgPicture.asset(Svgs.mongodb, color: imageColor),
      SvgPicture.asset(Svgs.mysql, color: imageColor),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          const Expanded(flex: 2, child: SectionHeader('About')),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.2,
                horizontal: size.width * 0.08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 1800),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 270),
                          child: ClipPath(
                            clipper: BlobClipper(id: '6-8-34659'),
                            // child: Image.asset(Images.),
                            child: const FlutterLogo(),
                          ),
                        ),
                        Transform.rotate(
                          angle: animation.value * 360.0,
                          child: Blob.fromID(
                            size: 200,
                            id: const ['6-8-6090'],
                            styles: BlobStyles(
                              color: const Color(0xffFC427B),
                              fillType: BlobFillType.stroke,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: (animation.value * 0.5) * 360.0,
                          child: Blob.fromID(
                            size: 200,
                            id: const ['6-8-115566'],
                            styles: BlobStyles(
                              color: const Color(0xffB33771),
                              fillType: BlobFillType.stroke,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 2100),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Monsieur Magnus',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          SvgPicture.asset(Svgs.wizard),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const DelayedDisplay(
                    delay: Duration(milliseconds: 2400),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        height: 2,
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                      child: Text(Strings.about),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 2100),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * 0.1),
                      child: const Divider(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 3000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tools', style: _textStyle),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: assets,
                          childAspectRatio: 9 / 2,
                          mainAxisSpacing: 50.0,
                          crossAxisSpacing: 20.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
