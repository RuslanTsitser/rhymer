import 'package:flutter/material.dart';

const primaryColor = Colors.purple;
var themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  primarySwatch: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
  dividerTheme: DividerThemeData(color: Colors.grey.shade200),
);
