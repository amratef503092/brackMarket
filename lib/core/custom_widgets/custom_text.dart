import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// widget translation

Widget customText(
    {required String text,
    List<String> args = const [],
    TextStyle? style =
        const TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.normal)}) {
  return Text(
    textAlign: TextAlign.center,
    text.tr(args: args),
    style: style,
  );
}
