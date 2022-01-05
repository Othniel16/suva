import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class DockItem extends StatefulWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onTap;
  const DockItem({Key? key, required this.label, this.icon, this.onTap})
      : super(key: key);

  @override
  State<DockItem> createState() => _DockItemState();
}

class _DockItemState extends State<DockItem> {
  bool hovering = false;
  late Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovering = false;
        });
      },
      child: Tooltip(
        message: widget.label,
        preferBelow: false,
        textStyle:
            const TextStyle(color: Colors.grey, fontFamily: 'EBGarammond'),
        decoration: BoxDecoration(
          color: ThemeProvider.themeOf(context).id == 'knight'
              ? const Color(0xFF161616)
              : Colors.white,
          borderRadius: BorderRadius.circular(6.0),
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
        margin: const EdgeInsets.only(bottom: 30.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: InkWell(
          onTap: widget.onTap,
          child: AnimatedContainer(
            transform: Matrix4.identity()..translate(0, hovering ? -15 : 0),
            duration: const Duration(milliseconds: 100),
            child: GlassContainer.frostedGlass(
              height: size.height * 0.07,
              width: size.height * 0.07,
              alignment: Alignment.center,
              borderColor: Colors.transparent,
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(12.0),
              child: widget.icon ?? Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute(this.child);
  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => 'barrierLabel';

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
