import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:suva/exports.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
    return SizedBox(
      height: size.height,
      child: Row(
        children: [
          const Expanded(flex: 2, child: SectionHeader('Contact')),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverDetector(
                        builder: (isHovered) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 50.0,
                            color: isHovered ? Colors.black : Colors.white,
                            margin: const EdgeInsets.only(bottom: 20.0),
                            child: Marquee(
                              velocity: isHovered ? 50.0 : 100.0,
                              blankSpace: 30.0,
                              text: 'Email: othnielussher16@gmail.com',
                              startAfter: const Duration(milliseconds: 1500),
                              style: TextStyle(
                                color: isHovered ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      HoverDetector(builder: (isHovered) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: 50.0,
                          color: isHovered ? Colors.black : Colors.white,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Marquee(
                            velocity: isHovered ? 50.0 : 100.0,
                            blankSpace: 30.0,
                            text: 'Instagram: @_ussher',
                            textDirection: TextDirection.rtl,
                            startAfter: const Duration(milliseconds: 2500),
                            style: TextStyle(
                              color: isHovered ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                      HoverDetector(builder: (isHovered) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: 50.0,
                          color: isHovered ? Colors.black : Colors.white,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Marquee(
                            velocity: isHovered ? 50.0 : 100.0,
                            blankSpace: 30.0,
                            text: 'Twitter: @Cool_Oth',
                            startAfter: const Duration(milliseconds: 3500),
                            style: TextStyle(
                              color: isHovered ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
