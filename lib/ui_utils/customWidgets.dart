import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static Widget appText({String? text, TextStyle? style}) {
    return Text(
      text ?? "",
      style: GoogleFonts.nunito(textStyle: style),
      softWrap: true,
    );
  }
}
