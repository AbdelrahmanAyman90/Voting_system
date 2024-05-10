import 'package:flutter/cupertino.dart';

double getResponsiveFontsize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontsize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontsize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 500) {
    return width / 400;
  } else if (width < 1000) {
    return width / 600;
  } else {
    return width / 1100;
  }
}
