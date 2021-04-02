import 'package:flutter/material.dart';
import 'package:flutterando/app/utils/widgets/alert/alert.dart';

class AlertAnimate extends StatefulWidget {
  final String message;
  final Color color;
  final double fontScale;
  AlertAnimate(this.message, this.color, this.fontScale);

  @override
  _AlertAnimateState createState() => _AlertAnimateState();
}

class _AlertAnimateState extends State<AlertAnimate>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 1, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: Alert(widget.message, widget.color, widget.fontScale),
      opacity: animation.value,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
