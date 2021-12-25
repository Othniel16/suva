import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class Dock extends StatelessWidget {
  const Dock({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
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
                        const SizedBox(width: 10.0),
                        VerticalDivider(
                            color: Colors.grey.withOpacity(0.3), width: 3.0),
                        const SizedBox(width: 10.0),
                        DockItem(
                          label: 'Mail',
                          onTap: () => provider.changeSection = 3,
                          icon: const FaIcon(
                            FontAwesomeIcons.envelope,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const DockItem(
                          label: 'Instagram',
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const DockItem(
                          label: 'Twitter',
                          icon: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const DockItem(
                          label: 'GitHub',
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.grey,
                          ),
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
}
