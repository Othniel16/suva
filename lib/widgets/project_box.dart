import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class ProjectBox extends StatelessWidget {
  final int index;
  final Color? color;
  final Widget? child;
  final String type, name, year;

  const ProjectBox({
    Key? key,
    this.child,
    this.color = Colors.white,
    required this.index,
    required this.type,
    required this.name,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(height: 5.0, width: 100.0, color: Colors.white),
                  const SizedBox(height: 8.0),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),
              BorderedText(
                strokeWidth: 1.0,
                strokeColor: Colors.white,
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 40.0,
                    color: Colors.transparent,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          Text(
            year,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Urbanist',
            ),
          ),
          const Divider(color: Colors.white, thickness: 1.3),
        ],
      ),
    );
  }
}
