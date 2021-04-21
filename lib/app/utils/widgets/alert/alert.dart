import 'package:flutter/material.dart';

import '../../text_styles/text_styles.dart';

class Alert extends StatelessWidget {
  final String message;
  final Color color;
  final double fontScale;
  Alert(this.message, this.color, this.fontScale);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 8, bottom: 4, top: 4),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: new BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        width: double.infinity,
        child: SelectableText(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.roboto(10 * fontScale),
        ),
      ),
    );
  }
}
