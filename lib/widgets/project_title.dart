import 'package:flutter/material.dart';

class ProjectTitle extends StatelessWidget {
  final String caption;
  final Color? captionColor;

  const ProjectTitle(this.caption, {Key? key, this.captionColor})
      : super(key: key);

  @override
  Widget build(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.46,
      ),
      child: Text(
        caption,
        style: TextStyle(
          fontSize: 40.0,
          color: captionColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
