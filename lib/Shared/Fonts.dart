import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting/Shared/responsive_text.dart';

abstract class AppFonts {
  static TextStyle regularText(
    context,
    double fontSize,
    Color? color,
  ) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontsize(context, fontSize: fontSize),
      color: color!,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle boldText(
    context,
    double fontSize,
    Color? color,
  ) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontsize(context, fontSize: fontSize),
      color: color!,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle semiBoldText(
    context,
    double fontSize,
    Color? color,
  ) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontsize(context, fontSize: fontSize),
      color: color!,
      fontWeight: FontWeight.w600, // semi-bold
    );
  }
}
