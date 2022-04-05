import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class VolutaForms {
  static _textField(String current, Function(String) onChanged,
          {String hintText,
          FocusNode node,
          String Function(String) validator,
          Function(String) onFieldSubmitted,
          TextInputType inputType = TextInputType.text,
          bool submitted = false,
          bool disabled = false,
          List<TextInputFormatter> formatters,
          Widget suffix,
          Widget prefix,
          bool obscure = false,
          int lines = 1}) =>
      TextFormField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          initialValue: current,
          focusNode: node,
          inputFormatters: formatters,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          autofocus: false,
          obscureText: obscure,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ?? null,
          onChanged: onChanged,
          maxLines: lines,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            suffixIcon: suffix,
            filled: true,
            isDense: true,
            hintText: hintText,
            enabled: !disabled,
            hintMaxLines: lines,
            errorStyle: TextStyle(color: Color(0xffef526d)),
            prefixIcon: prefix,
            hintStyle:
                TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: Color(0xffef526d).withOpacity(0.2))),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: Color(0xffef526d).withOpacity(0.2))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white)),
            fillColor:
                !submitted || (validator != null && validator(current) == null)
                    ? Colors.white.withOpacity(0.1)
                    : Color(0xffef526d).withOpacity(0.1),
            focusColor:
                !submitted || (validator != null && validator(current) == null)
                    ? Colors.white.withOpacity(0.1)
                    : Color(0xffef526d).withOpacity(0.1),
          ));
  static Widget getPasscodeField(String current, Function(String) onChanged,
          {FocusNode node,
          String Function(String) validator,
          Function(String) onFieldSubmitted,
          TextInputType inputType = TextInputType.text,
          bool submitted = false,
          bool disabled = false,
          List<TextInputFormatter> formatters,
          Widget suffix,
          Widget prefix,
          bool obscure = false,
          int lines = 1}) =>
      TextFormField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          initialValue: current,
          focusNode: node,
          inputFormatters: formatters,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          autofocus: false,
          obscureText: obscure,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ?? null,
          onChanged: onChanged,
          maxLines: 1,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration());
  static Widget getTextField(String current, Function(String) onChanged,
          {String hint,
          String label = "",
          int lines = 1,
          bool disabled = false,
          Widget suffix}) =>
      Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty)
                  Text(label.toUpperCase(),
                      style: GoogleFonts.barlowCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Palette.gold60)),
                if (label.isNotEmpty) Container(height: 16),
                _textField(current, onChanged,
                    hintText: hint,
                    lines: lines,
                    disabled: disabled,
                    suffix: suffix)
              ],
              mainAxisSize: MainAxisSize.min));

  static Widget getListItem(BuildContext context, String label,
          Function(String) onRemovePressed) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(children: [
          VolutaButtons.secondary(context, () => onRemovePressed(label),
              Icon(Icons.close, color: Palette.gold60)),
          Container(width: 24),
          VolutaText.h2(label, color: Palette.grey10)
        ]),
      );

  static Widget getEmailField(String current, Function(String) onChanged,
          {String hint, String label = ""}) =>
      Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty)
                  Text(label.toUpperCase(),
                      style: GoogleFonts.barlowCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Palette.gold60)),
                if (label.isNotEmpty) Container(height: 16),
                _textField(current, onChanged,
                    hintText: hint, inputType: TextInputType.emailAddress)
              ],
              mainAxisSize: MainAxisSize.min));

  static Widget getFormRow(List<Widget> fields, {double gap = 12}) {
    List<Widget> children = [];
    for (var i = 0; i < fields.length; i++) {
      children.add(Expanded(child: fields[i]));
      if (i != fields.length - 1) children.add(Container(width: gap));
    }
    return Container(
        width: double.infinity,
        child: Row(
          children: children,
          mainAxisSize: MainAxisSize.max,
        ));
  }

  static Widget getInlineAddRow(List<Widget> fields, Function onAddPressed,
      {double gap = 12, bool canAdd = true}) {
    List<Widget> children = [];
    for (var i = 0; i < fields.length; i++) {
      children.add(Expanded(child: fields[i]));
      if (i != fields.length - 1) children.add(Container(width: gap));
    }
    children.add(Padding(
        child: IconButton(
          onPressed: () => onAddPressed(),
          icon: Icon(Icons.add, color: Palette.gold60, size: 18),
        ),
        padding: EdgeInsets.only(left: 16)));
    return Container(
        width: double.infinity,
        child: Row(
          children: children,
          mainAxisSize: MainAxisSize.max,
        ));
  }

  static getToggle(String label, bool value, Function(bool) onToggled) =>
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        VolutaText.h3(label),
        Expanded(
            child: Padding(
                child: Container(color: Palette.gold60, height: 2),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 49.5))),
        GestureDetector(
            child: Container(
              height: 48,
              width: 48,
              child: value
                  ? Icon(Icons.check, color: Colors.white, size: 32)
                  : null,
              decoration: BoxDecoration(
                  border: Border.all(color: Palette.gold60),
                  borderRadius: BorderRadius.circular(8)),
            ),
            onTap: () => onToggled(!value))
      ]));

  static getSwitch(String label, bool value, Function(bool) onToggled) =>
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Palette.backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Palette.softHighlightColor,
                    offset: Offset(-8, -8),
                    spreadRadius: 0,
                    blurRadius: 8),
                BoxShadow(
                    color: Palette.softShadowColor,
                    offset: Offset(8, 8),
                    spreadRadius: 0,
                    blurRadius: 8)
              ]),
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            VolutaText.h3(label),
            Container(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              color: value ? Palette.gold60 : null,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(16),
                          child: VolutaText.h3("YES",
                              color: value ? Palette.white : Palette.gold60)),
                      onTap: () => onToggled(true)),
                  GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              color: !value ? Palette.gold60 : null,
                              borderRadius: BorderRadius.circular(8)),
                          child: VolutaText.h3("NO",
                              color: !value ? Palette.white : Palette.gold60),
                          padding: EdgeInsets.all(16)),
                      onTap: () => onToggled(false))
                ]),
                decoration: BoxDecoration(
                    border: Border.all(color: Palette.gold60),
                    borderRadius: BorderRadius.circular(8)),
              )
            ]))
          ]));
}
