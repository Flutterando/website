import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../utils/colors/colors.dart';
import '../../../../../../utils/text_styles/text_styles.dart';
import '../../footer_controller.dart';

class SendButton extends StatefulWidget {
  final Function sendContact;
  SendButton(this.sendContact);
  @override
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends ModularState<SendButton, FooterController> {
  @override
  Widget build(BuildContext context) {
    final fontScale = controller.screen.fontScale(context);
    return Align(
      child: InkWell(
        child: Container(
          decoration: new BoxDecoration(
            color: PrimaryColors.dark,
            borderRadius: const BorderRadius.all(
              const Radius.circular(2.0),
            ),
          ),
          alignment: Alignment.center,
          width: double.infinity,
          height: 28 * fontScale,
          child: Text(
            'Enviar',
            style:
                TextStyles.roboto(12 * fontScale, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          widget.sendContact();
        },
      ),
    );
  }
}
