import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/util/models/forms/support.form.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/forms.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class SupportPage extends StatefulWidget {
  SupportPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  SupportForm form;
  @override
  void initState() {
    super.initState();
    this.form = SupportForm.instance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(32),
            decoration: Palette.background,
            child: Column(children: [
              VolutaText.header(context, "TATTOO RELEASE FORM IN-APP SUPPORT"),
              VolutaText.body1(
                "We provide email based tech support for our apps. We invite all questions and suggestions. Thank you for helping us make stellar apps for the tattoo industry",
              ),
              VolutaForms.getFormRow([
                VolutaForms.getTextField(form.firstName, onFirstNameChanged,
                    hint: "Enter your first name", label: "first name"),
                VolutaForms.getTextField(form.lastName, onLastNameChanged,
                    hint: "Enter your last name", label: "last name")
              ]),
              VolutaForms.getEmailField(form.email, onEmailChanged,
                  hint: "Enter your email address", label: 'Your email'),
              VolutaForms.getTextField(form.body, onQuestionChanged,
                  hint: "Enter your question or comment",
                  label: "QUESTION OR COMMENT",
                  lines: 5),
              VolutaButtons.primary(context, onSubmitPressed,
                  VolutaText.h1("SEND MESSAGE", color: Palette.grey60))
            ])));
  }

  onFirstNameChanged(String value) {
    setState(() {
      form.firstName = value;
    });
  }

  onLastNameChanged(String value) {
    setState(() {
      form.firstName = value;
    });
  }

  onEmailChanged(String value) {
    setState(() {
      form.email = value;
    });
  }

  onQuestionChanged(String value) {
    setState(() {
      form.body = value;
    });
  }

  onSubmitPressed() {
    form.submit();

    Navigator.of(context).pop();
  }
}
