import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class SectionLabel extends StatelessWidget {
  final String label;
  final Color? smallTextColor, bigTextColor;

  const SectionLabel({
    Key? key,
    required this.label,
    this.smallTextColor = Colors.black,
    this.bigTextColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BorderedText(
          strokeColor: Colors.transparent,
          strokeWidth: 1.0,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 200.0,
              color: bigTextColor,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Positioned(
          top: 60.0,
          left: 120.0,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 40.0,
              color: smallTextColor,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
