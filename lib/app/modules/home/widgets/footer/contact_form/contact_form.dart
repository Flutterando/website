import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/app/modules/home/domain/entities/send_contact/contact.dart';
import 'package:flutterando/app/modules/home/widgets/footer/contact_form/widgets/send_button.dart';
import 'package:flutterando/app/modules/home/widgets/footer/footer_controller.dart';
import 'package:flutterando/app/utils/text_styles/text_styles.dart';
import 'package:flutterando/app/utils/validations/validations.dart';
import 'package:flutterando/app/utils/widgets/alert/alert_animate.dart';
import 'package:localization/localization.dart';

import '../../../domain/entities/send_contact/result_contact.dart';
import '../../../domain/errors/errors_send_contact.dart';
import 'widgets/contact_field.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _message = TextEditingController();
  final controller = Modular.get<FooterController>();

  @override
  void dispose() {
    Modular.dispose<FooterController>();
    super.dispose();
    _name.dispose();
    _email.dispose();
    _message.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final fontScale = controller.screen.fontScale(context);
    return Container(
      width: 270 * fontScale,
      child: FocusScope(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "form_title".i18n(),
                style: TextStyles.notoSans(
                  18 * fontScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ContactField(
                title: "form_name".i18n(),
                maxLines: 1,
                controller: _name,
                validator: isNotEmptyValidationText,
              ),
              ContactField(
                title: "form_email".i18n(),
                maxLines: 1,
                controller: _email,
                validator: emailValidationText,
              ),
              ContactField(
                title: "form_your_message".i18n(),
                maxLines: 5,
                controller: _message,
                validator: isNotEmptyValidationText,
              ),
              Container(
                width: double.infinity,
                height: 38 * fontScale,
                child: ScopedBuilder<FooterController, FailureSendContact, ResultContact>(
                  store: controller,
                  onError: (context, error) => AlertAnimate(
                    error.toString(),
                    Colors.red,
                    fontScale,
                  ),
                  onLoading: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  onState: (context, state) {
                    return SendButton(
                      () async {
                        if (_formKey.currentState!.validate()) {
                          final contact = Contact(
                            name: _name.text,
                            email: _email.text,
                            message: _message.text,
                          );
                          await controller.sendContact(contact);
                          _name.clear();
                          _email.clear();
                          _message.clear();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
