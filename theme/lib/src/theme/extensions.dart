import 'package:flutter/widgets.dart';

extension EdgeInsetsX on EdgeInsets {
  EdgeInsets get verticalOnly => copyWith(left: 0, right: 0);

  EdgeInsets get horizontalOnly => copyWith(top: 0, bottom: 0);

  EdgeInsets get leftOnly => copyWith(right: 0, top: 0, bottom: 0);

  EdgeInsets get topOnly => copyWith(left: 0, right: 0, bottom: 0);

  EdgeInsets get bottomOnly => copyWith(left: 0, right: 0, top: 0);

  EdgeInsets get rightOnly => copyWith(top: 0, left: 0, bottom: 0);
}

extension BorderRadiusX on BorderRadius {
  BorderRadius get leftOnly => copyWith(
        topRight: Radius.zero,
        bottomRight: Radius.zero,
      );

  BorderRadius get rightOnly => copyWith(
        topLeft: Radius.zero,
        bottomLeft: Radius.zero,
      );

  BorderRadius get topOnly => copyWith(
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      );

  BorderRadius get bottomOnly => copyWith(
        topLeft: Radius.zero,
        topRight: Radius.zero,
      );
}
