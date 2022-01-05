import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suva/exports.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class Dock extends StatefulWidget {
  const Dock({Key? key}) : super(key: key);

  @override
  State<Dock> createState() => _DockState();
}

class _DockState extends State<Dock> {
  bool isLightTheme = true;
  bool hovering = false;
  static var lightTheme = const Icon(
    CupertinoIcons.sun_max,
    color: Colors.grey,
  );

  static var darkTheme = const Icon(
    CupertinoIcons.moon,
    color: Colors.grey,
  );

  var themeIcon = darkTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SectionProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              provider.sections[provider.selectedSection],
              Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: ThemeProvider.themeOf(context).id == 'knight'
                          ? const Color(0xFF161616)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeProvider.themeOf(context).id == 'knight'
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.1),
                          offset: const Offset(0, 34),
                          spreadRadius: 10.0,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DockItem(
                          label: 'Home',
                          onTap: () => provider.changeSection = 0,
                          icon: const FaIcon(
                            FontAwesomeIcons.igloo,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'About',
                          onTap: () => provider.changeSection = 1,
                          icon: const FaIcon(
                            FontAwesomeIcons.userCircle,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'Projects',
                          icon: const FaIcon(
                            FontAwesomeIcons.terminal,
                            color: Colors.grey,
                          ),
                          onTap: () => provider.changeSection = 2,
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'Theme',
                          icon: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 500),
                            secondChild: lightTheme,
                            firstChild: darkTheme,
                            crossFadeState: isLightTheme
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                          onTap: () {
                            ThemeProvider.controllerOf(context).nextTheme();
                            setState(() {
                              isLightTheme = !isLightTheme;
                              if (isLightTheme) {
                                themeIcon = darkTheme;
                              } else {
                                themeIcon = lightTheme;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        VerticalDivider(
                            color: Colors.grey.withOpacity(0.3), width: 3.0),
                        const SizedBox(width: 10.0),
                        DockItem(
                          label: 'Mail',
                          onTap: () async => await launchMailto(),
                          icon: const FaIcon(
                            FontAwesomeIcons.envelope,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'GitHub',
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            html.window.open(Urls.github, 'GitHub');
                          },
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'LinkedIn',
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            html.window.open(Urls.github, 'GitHub');
                          },
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'Instagram',
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            html.window.open(Urls.instagram, 'Instagram');
                          },
                        ),
                        const SizedBox(width: 8.0),
                        DockItem(
                          label: 'Twitter',
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            html.window.open(Urls.twitter, 'Twitter');
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const DockItem(
                          label: 'Resume',
                          icon: FaIcon(
                            FontAwesomeIcons.solidFile,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> launchMailto() async {
    final mailtoLink = Mailto(to: ['othnielussher16@gmail.com']);
    await launch('$mailtoLink');
  }
}
