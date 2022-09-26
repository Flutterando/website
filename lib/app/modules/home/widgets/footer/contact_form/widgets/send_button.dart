import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer_controller.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:localization/localization.dart';

class SendButton extends StatefulWidget {
  final Function sendContact;
  SendButton(this.sendContact);
  @override
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  final controller = Modular.get<FooterController>();
  @override
  void dispose() {
    Modular.dispose<FooterController>();
    super.dispose();
  }

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
            "form_button".i18n(),
            style:
                TextStyles.roboto(12 * fontScale, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () async {
          await widget.sendContact();
        },
      ),
    );
  }
}
