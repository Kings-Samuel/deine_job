import 'package:deine_job/helpers/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text headingText(
    {required String text,
    Color color = Palette.textColorDark,
    double fontSize = 25,
    TextAlign textAlign = TextAlign.center,
    fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: GoogleFonts.lato(color: color, fontSize: fontSize, fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Text bodyText(
    {required String text,
    Color color = Palette.textColorLight,
    bool bold = false,
    double fontSize = 14,
    bool underlineText = false}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        decoration: underlineText ? TextDecoration.underline : null,
        decorationStyle: underlineText ? TextDecorationStyle.dotted : null,
        decorationColor: underlineText ? color : null),
  );
}
