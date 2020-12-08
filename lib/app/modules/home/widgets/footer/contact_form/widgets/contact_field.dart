import 'package:flutter/material.dart';
import 'package:flutterando/app/utils/colors/colors.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';

class ContactField extends StatelessWidget {
  final String title;
  final int maxLines;
  final Function(String) validator;
  final TextEditingController controller;

  const ContactField({
    this.title,
    this.maxLines,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget() {
      return Focus(
        descendantsAreFocusable: false,
        canRequestFocus: false,
        child: SelectableText(
          title,
          style: TextStyles.roboto(20),
        ),
      );
    }

    Widget textFieldWidget() {
      return TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator ?? validator,
        style: TextStyles.roboto(16),
        decoration: new InputDecoration(
          filled: true,
          fillColor: PrimaryColors.darkest,
          errorStyle: TextStyle(fontSize: 14),
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          )),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        titleWidget(),
        SizedBox(height: 6),
        textFieldWidget(),
      ],
    );
  }
}
