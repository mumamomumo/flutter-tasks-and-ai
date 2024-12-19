import 'package:flutter/material.dart';

class WeirdYellow {
  static const primary = {
    50: Color(0xFFfffde6),
    100: Color(0xFFfffbcc),
    200: Color(0xFFfef89a),
    300: Color(0xFFfef467),
    400: Color(0xFFfef134),
    500: Color(0xFFfeed01),
    600: Color(0xFFcbbe01),
    700: Color(0xFF988e01),
    800: Color(0xFF655f01),
    900: Color(0xFF332f00),
  };

  static const secondary = {
    50: Color(0xFFe6f8ff),
    100: Color(0xFFcdf0fe),
    200: Color(0xFF9ae2fe),
    300: Color(0xFF68d3fd),
    400: Color(0xFF35c4fd),
    500: Color(0xFF03b6fc),
    600: Color(0xFF0291ca),
    700: Color(0xFF026d97),
    800: Color(0xFF014965),
    900: Color(0xFF012432),
  };

  static const accent = {
    50: Color(0xFFe6e6ff),
    100: Color(0xFFcdcdfe),
    200: Color(0xFF9c9afe),
    300: Color(0xFF6a68fd),
    400: Color(0xFF3835fd),
    500: Color(0xFF0703fc),
    600: Color(0xFF0502ca),
    700: Color(0xFF040297),
    800: Color(0xFF030165),
    900: Color(0xFF010132),
  };
  static const background = {
    50: Color(0xFFfffce5),
    100: Color(0xFFfff9cc),
    200: Color(0xFFfff399),
    300: Color(0xFFffed66),
    400: Color(0xFFffe733),
    500: Color(0xFFffe100),
    600: Color(0xFFccb400),
    700: Color(0xFF998700),
    800: Color(0xFF665a00),
    900: Color(0xFF332d00),
  };
  static const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFfef46b),
    onPrimary: Color(0xFF231f00),
    secondary: Color(0xFF0278a7),
    onSecondary: Color(0xFFfffcd0),
    tertiary: Color(0xFF140ffd),
    onTertiary: Color(0xFFfffcd0),
    surface: Color(0xFF231f00),
    onSurface: Color(0xFFfffcd0),
    error: Brightness.dark == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.dark == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  );
}



class AppColors{
  static const primary = {
  50: Color(0xFFebfaf8),
  100: Color(0xFFd6f5f0),
  200: Color(0xFFaeeae1),
  300: Color(0xFF85e0d2),
  400: Color(0xFF5dd5c3),
  500: Color(0xFF34cbb4),
  600: Color(0xFF2aa290),
  700: Color(0xFF1f7a6c),
  800: Color(0xFF155148),
  900: Color(0xFF0a2924),
};

static const secondary = {
  50: Color(0xFFe9fbf9),
  100: Color(0xFFd3f8f3),
  200: Color(0xFFa7f1e7),
  300: Color(0xFF7beadb),
  400: Color(0xFF50e2cf),
  500: Color(0xFF24dbc3),
  600: Color(0xFF1daf9c),
  700: Color(0xFF158475),
  800: Color(0xFF0e584e),
  900: Color(0xFF072c27),
};

static const accent = {
  50: Color(0xFFe7fdfa),
  100: Color(0xFFd0fbf5),
  200: Color(0xFFa1f7ec),
  300: Color(0xFF71f4e2),
  400: Color(0xFF42f0d9),
  500: Color(0xFF13eccf),
  600: Color(0xFF0fbda6),
  700: Color(0xFF0b8e7c),
  800: Color(0xFF085e53),
  900: Color(0xFF042f29),
};
static const background = {
  50: Color(0xFFecf8f7),
  100: Color(0xFFd9f2ee),
  200: Color(0xFFb4e4de),
  300: Color(0xFF8ed7cd),
  400: Color(0xFF68cabd),
  500: Color(0xFF42bdac),
  600: Color(0xFF35978a),
  700: Color(0xFF287167),
  800: Color(0xFF1b4b45),
  900: Color(0xFF0d2622),
};
static const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF8fe2d6),
  onPrimary: Color(0xFF081715),
  secondary: Color(0xFF189483),
  onSecondary: Color(0xFF081715),
  tertiary: Color(0xFF25edd1),
  onTertiary: Color(0xFF081715),
  surface: Color(0xFF081715),
  onSurface: Color(0xFFedf6f5),
  error: Brightness.dark == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);
}