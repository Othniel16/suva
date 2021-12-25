import 'package:flutter/material.dart';

class HoverDetector extends StatefulWidget {
  final bool transform;
  final Widget Function(bool isHovered) builder;

  const HoverDetector({Key? key, required this.builder, this.transform = false})
      : super(key: key);

  @override
  _HoverDetectorState createState() => _HoverDetectorState();
}

class _HoverDetectorState extends State<HoverDetector> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(-10, -10, 0);

    // use transform to elevate the child
    final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration:  Duration(milliseconds: widget.transform ?  100 : 0),
        transform: widget.transform ? transform : null,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
