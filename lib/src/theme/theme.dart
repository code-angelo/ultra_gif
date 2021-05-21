import 'package:flutter/material.dart';

import '../colors.dart';

final ultraGifTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: BLACK,
  primaryColor: BLACK, //appbar color
  // iconTheme: IconThemeData(color: GREEN),
  accentColor: YELLOW,
  appBarTheme: AppBarTheme(
    backgroundColor: BLACK,
    iconTheme: IconThemeData(
      color: GREEN
    )
  ),
);
