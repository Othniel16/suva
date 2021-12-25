import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class SectionHeader extends StatelessWidget {
  final String label;

  const SectionHeader(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      child: FittedBox(
        child: DelayedDisplay(
          delay: const Duration(milliseconds: 1000),
          slidingBeginOffset: const Offset(-0.35, 0),
          fadingDuration: const Duration(milliseconds: 500),
          child: RotatedBox(
            quarterTurns: 1,
            child: SectionLabel(
              label: label,
              bigTextColor: Colors.grey.withOpacity(0.08),
            ),
          ),
        ),
      ),
    );
  }
}
