import 'package:flutter/material.dart';

// Colors

@immutable
class InsdSemanticColors extends ThemeExtension<InsdSemanticColors> {
  final Color textMain;

  final Color textPassive1;
  final Color textPassive2;
  final Color textPassive3;

  final Color boxBackground;
  final Color boxOverlay;

  final Color boxForeground1;
  final Color boxForeground2;
  final Color boxForeground3;

  final Color boxBorder1;
  final Color boxBorder2;
  final Color boxBorder3;

  final Color boxFilled1;
  final Color boxFilled2;
  final Color boxFilled3;

  final Color secondaryRed;
  final Color secondaryYellow;
  final Color secondaryGreen;
  final Color secondaryBlue;

  const InsdSemanticColors({
    // text
    required this.textMain,

    // text/passive
    required this.textPassive1,
    required this.textPassive2,
    required this.textPassive3,

    // box
    required this.boxBackground,
    required this.boxOverlay,

    // box/foreground
    required this.boxForeground1,
    required this.boxForeground2,
    required this.boxForeground3,

    // box/border
    required this.boxBorder1,
    required this.boxBorder2,
    required this.boxBorder3,

    // box/filled
    required this.boxFilled1,
    required this.boxFilled2,
    required this.boxFilled3,

    // secondary
    required this.secondaryRed,
    required this.secondaryYellow,
    required this.secondaryGreen,
    required this.secondaryBlue,
  });

  @override
  InsdSemanticColors copyWith({
    Color? textMain,
    Color? textPassive1,
    Color? textPassive2,
    Color? textPassive3,
    Color? boxBackground,
    Color? boxOverlay,
    Color? boxForeground1,
    Color? boxForeground2,
    Color? boxForeground3,
    Color? boxBorder1,
    Color? boxBorder2,
    Color? boxBorder3,
    Color? boxFilled1,
    Color? boxFilled2,
    Color? boxFilled3,
    Color? secondaryRed,
    Color? secondaryYellow,
    Color? secondaryGreen,
    Color? secondaryBlue,
  }) =>
      InsdSemanticColors(
        textMain: textMain ?? this.textMain,
        textPassive1: textPassive1 ?? this.textPassive1,
        textPassive2: textPassive2 ?? this.textPassive2,
        textPassive3: textPassive3 ?? this.textPassive3,
        boxBackground: boxBackground ?? this.boxBackground,
        boxOverlay: boxOverlay ?? this.boxOverlay,
        boxForeground1: boxForeground1 ?? this.boxForeground1,
        boxForeground2: boxForeground2 ?? this.boxForeground2,
        boxForeground3: boxForeground3 ?? this.boxForeground3,
        boxBorder1: boxBorder1 ?? this.boxBorder1,
        boxBorder2: boxBorder2 ?? this.boxBorder2,
        boxBorder3: boxBorder3 ?? this.boxBorder3,
        boxFilled1: boxFilled1 ?? this.boxFilled1,
        boxFilled2: boxFilled2 ?? this.boxFilled2,
        boxFilled3: boxFilled3 ?? this.boxFilled3,
        secondaryRed: secondaryRed ?? this.secondaryRed,
        secondaryYellow: secondaryYellow ?? this.secondaryYellow,
        secondaryGreen: secondaryGreen ?? this.secondaryGreen,
        secondaryBlue: secondaryBlue ?? this.secondaryBlue,
      );

  @override
  InsdSemanticColors lerp(InsdSemanticColors? other, double t) {
    if (other is! InsdSemanticColors) return this;

    return copyWith(
      textMain: Color.lerp(textMain, other.textMain, t),
      textPassive1: Color.lerp(textPassive1, other.textPassive1, t),
      textPassive2: Color.lerp(textPassive2, other.textPassive2, t),
      textPassive3: Color.lerp(textPassive3, other.textPassive3, t),
      boxBackground: Color.lerp(boxBackground, other.boxBackground, t),
      boxOverlay: Color.lerp(boxOverlay, other.boxOverlay, t),
      boxForeground1: Color.lerp(boxForeground1, other.boxForeground1, t),
      boxForeground2: Color.lerp(boxForeground2, other.boxForeground2, t),
      boxForeground3: Color.lerp(boxForeground3, other.boxForeground3, t),
      boxBorder1: Color.lerp(boxBorder1, other.boxBorder1, t),
      boxBorder2: Color.lerp(boxBorder2, other.boxBorder2, t),
      boxBorder3: Color.lerp(boxBorder3, other.boxBorder3, t),
      boxFilled1: Color.lerp(boxFilled1, other.boxFilled1, t),
      boxFilled2: Color.lerp(boxFilled2, other.boxFilled2, t),
      boxFilled3: Color.lerp(boxFilled3, other.boxFilled3, t),
      secondaryRed: Color.lerp(secondaryRed, other.secondaryRed, t),
      secondaryYellow: Color.lerp(secondaryYellow, other.secondaryYellow, t),
      secondaryGreen: Color.lerp(secondaryGreen, other.secondaryGreen, t),
      secondaryBlue: Color.lerp(secondaryBlue, other.secondaryBlue, t),
    );
  }
}

// Absolute Color Creation

Color Function(int opacity) _createDarkSolid(int r, int g, int b) =>
    (int opacity) => Color.fromARGB(
        255, r * opacity ~/ 100, g * opacity ~/ 100, b * opacity ~/ 100);

Color Function(int opacity) _createLightSolid(int r, int g, int b) =>
    (int opacity) => Color.fromARGB(
        255,
        r + (255 - r) * (100 - opacity) ~/ 100,
        g + (255 - g) * (100 - opacity) ~/ 100,
        b + (255 - b) * (100 - opacity) ~/ 100);

Color Function(int opacity) _createAlpha(int r, int g, int b) =>
    (int opacity) => Color.fromARGB(opacity * 255 ~/ 100, r, g, b);

// Absolute Colors

class DarkAbsoluteColors {
  final solid = _DarkSolidColors();
  final alpha = _AlphaColors();
}

class LightAbsoluteColors {
  final solid = _LightSolidColors();
  final alpha = _AlphaColors();
}

class _AlphaColors {
  Color Function(int opacity) get dark => _createAlpha(255, 255, 255);
  Color Function(int opacity) get light => _createAlpha(0, 0, 0);
  Color Function(int opacity) get red => _createAlpha(252, 79, 79);
  Color Function(int opacity) get yellow => _createAlpha(255, 191, 68);
  Color Function(int opacity) get green => _createAlpha(69, 199, 104);
  Color Function(int opacity) get blue => _createAlpha(60, 137, 255);
}

class _DarkSolidColors {
  Color Function(int opacity) get gray => _createDarkSolid(255, 255, 255);
  Color Function(int opacity) get red => _createDarkSolid(252, 79, 79);
  Color Function(int opacity) get yellow => _createDarkSolid(255, 191, 68);
  Color Function(int opacity) get green => _createDarkSolid(69, 199, 104);
  Color Function(int opacity) get blue => _createDarkSolid(60, 137, 255);
}

class _LightSolidColors {
  Color Function(int opacity) get gray => _createLightSolid(0, 0, 0);
  Color Function(int opacity) get red => _createLightSolid(252, 79, 79);
  Color Function(int opacity) get yellow => _createLightSolid(255, 191, 68);
  Color Function(int opacity) get green => _createLightSolid(69, 199, 104);
  Color Function(int opacity) get blue => _createLightSolid(60, 137, 255);
}

final _darkAbsoluteColors = DarkAbsoluteColors();
final _lightAbsoluteColors = LightAbsoluteColors();

class InsdAbsoluteColors extends ThemeExtension<InsdAbsoluteColors> {
  final Color Function(int opacity) solidGray;
  final Color Function(int opacity) solidRed;
  final Color Function(int opacity) solidYellow;
  final Color Function(int opacity) solidGreen;
  final Color Function(int opacity) solidBlue;

  final Color Function(int opacity) alphaGray;
  final Color Function(int opacity) alphaInverse;

  final Color Function(int opacity) alphaRed = _darkAbsoluteColors.alpha.red;
  final Color Function(int opacity) alphaYellow =
      _darkAbsoluteColors.alpha.yellow;
  final Color Function(int opacity) alphaGreen =
      _darkAbsoluteColors.alpha.green;
  final Color Function(int opacity) alphaBlue = _darkAbsoluteColors.alpha.blue;

  InsdAbsoluteColors({
    required this.solidGray,
    required this.solidRed,
    required this.solidYellow,
    required this.solidGreen,
    required this.solidBlue,
    required this.alphaGray,
    required this.alphaInverse,
  });

  @override
  InsdAbsoluteColors copyWith(
          {Color Function(int opacity)? solidGray,
          Color Function(int opacity)? solidRed,
          Color Function(int opacity)? solidYellow,
          Color Function(int opacity)? solidGreen,
          Color Function(int opacity)? solidBlue,
          Color Function(int opacity)? alphaGray,
          Color Function(int opacity)? alphaInverse}) =>
      InsdAbsoluteColors(
        solidGray: solidGray ?? this.solidGray,
        solidRed: solidRed ?? this.solidRed,
        solidYellow: solidYellow ?? this.solidYellow,
        solidGreen: solidGreen ?? this.solidGreen,
        solidBlue: solidBlue ?? this.solidBlue,
        alphaGray: alphaGray ?? this.solidGray,
        alphaInverse: alphaInverse ?? this.alphaInverse,
      );

  @override
  InsdAbsoluteColors lerp(InsdAbsoluteColors? other, double t) {
    if (other is! InsdAbsoluteColors) return this;

    return copyWith();
  }
}

TextStyle Function(Color color) _createTextStyle(
        double fontSize, double height, FontWeight fontWeight) =>
    (Color color) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Inter",
        fontFamilyFallback: const ["NotoSansKR"],
        height: height / fontSize);

class InsdTexts {
  // title
  final TextStyle Function(Color color) title1 =
      _createTextStyle(26, 34, FontWeight.w700);
  final TextStyle Function(Color color) title2 =
      _createTextStyle(22, 30, FontWeight.w700);
  final TextStyle Function(Color color) title3 =
      _createTextStyle(18, 24, FontWeight.w700);

  // paragraph
  final TextStyle Function(Color color) paragraph1 =
      _createTextStyle(16, 28, FontWeight.w400);
  final TextStyle Function(Color color) paragraph2 =
      _createTextStyle(14, 24, FontWeight.w400);

  // ui
  final TextStyle Function(Color color) ui1 =
      _createTextStyle(16, 22, FontWeight.w400);
  final TextStyle Function(Color color) ui2 =
      _createTextStyle(14, 18, FontWeight.w400);
  final TextStyle Function(Color color) ui3 =
      _createTextStyle(12, 16, FontWeight.w400);

  // ui bold
  final TextStyle Function(Color color) uiBold1 =
      _createTextStyle(16, 22, FontWeight.w700);
  final TextStyle Function(Color color) uiBold2 =
      _createTextStyle(14, 18, FontWeight.w700);
  final TextStyle Function(Color color) uiBold3 =
      _createTextStyle(12, 16, FontWeight.w700);
}

class InsdIcons {
  static const _fontFamily = "InsdIcons";

  static const IconData arrow1Down = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData arrow1Left = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData arrow1Right = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData arrow1Up = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData arrow2Down = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData arrow2Left = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData arrow2Right = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData arrow2Up = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData bellDF = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData bellD = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData bellF = IconData(0xe90a, fontFamily: _fontFamily);
  static const IconData bell = IconData(0xe90b, fontFamily: _fontFamily);
  static const IconData bookmarkF = IconData(0xe90c, fontFamily: _fontFamily);
  static const IconData bookmark = IconData(0xe90d, fontFamily: _fontFamily);
  static const IconData bulbF = IconData(0xe90e, fontFamily: _fontFamily);
  static const IconData bulb = IconData(0xe90f, fontFamily: _fontFamily);
  static const IconData clockF = IconData(0xe910, fontFamily: _fontFamily);
  static const IconData clock = IconData(0xe911, fontFamily: _fontFamily);
  static const IconData commentF = IconData(0xe912, fontFamily: _fontFamily);
  static const IconData comment = IconData(0xe913, fontFamily: _fontFamily);
  static const IconData complete = IconData(0xe914, fontFamily: _fontFamily);
  static const IconData duplicate = IconData(0xe915, fontFamily: _fontFamily);
  static const IconData exit = IconData(0xe916, fontFamily: _fontFamily);
  static const IconData expandA1 = IconData(0xe917, fontFamily: _fontFamily);
  static const IconData expandA2 = IconData(0xe918, fontFamily: _fontFamily);
  static const IconData expandD1 = IconData(0xe919, fontFamily: _fontFamily);
  static const IconData expandD2 = IconData(0xe91a, fontFamily: _fontFamily);
  static const IconData expandH = IconData(0xe91b, fontFamily: _fontFamily);
  static const IconData expandV = IconData(0xe91c, fontFamily: _fontFamily);
  static const IconData eyeF = IconData(0xe91d, fontFamily: _fontFamily);
  static const IconData eye = IconData(0xe91e, fontFamily: _fontFamily);
  static const IconData fanF = IconData(0xe91f, fontFamily: _fontFamily);
  static const IconData fan = IconData(0xe920, fontFamily: _fontFamily);
  static const IconData filter = IconData(0xe921, fontFamily: _fontFamily);
  static const IconData folderF = IconData(0xe922, fontFamily: _fontFamily);
  static const IconData folder = IconData(0xe923, fontFamily: _fontFamily);
  static const IconData hamburger = IconData(0xe924, fontFamily: _fontFamily);
  static const IconData heartF = IconData(0xe925, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe926, fontFamily: _fontFamily);
  static const IconData homeF = IconData(0xe927, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe928, fontFamily: _fontFamily);
  static const IconData link = IconData(0xe929, fontFamily: _fontFamily);
  static const IconData lockedF = IconData(0xe92a, fontFamily: _fontFamily);
  static const IconData locked = IconData(0xe92b, fontFamily: _fontFamily);
  static const IconData login = IconData(0xe92c, fontFamily: _fontFamily);
  static const IconData logout = IconData(0xe92d, fontFamily: _fontFamily);
  static const IconData mailF = IconData(0xe92e, fontFamily: _fontFamily);
  static const IconData mail = IconData(0xe92f, fontFamily: _fontFamily);
  static const IconData minus = IconData(0xe930, fontFamily: _fontFamily);
  static const IconData moonF = IconData(0xe931, fontFamily: _fontFamily);
  static const IconData moon = IconData(0xe932, fontFamily: _fontFamily);
  static const IconData more = IconData(0xe933, fontFamily: _fontFamily);
  static const IconData penF = IconData(0xe934, fontFamily: _fontFamily);
  static const IconData pen = IconData(0xe935, fontFamily: _fontFamily);
  static const IconData photoF = IconData(0xe936, fontFamily: _fontFamily);
  static const IconData photo = IconData(0xe937, fontFamily: _fontFamily);
  static const IconData pinF = IconData(0xe938, fontFamily: _fontFamily);
  static const IconData pin = IconData(0xe939, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xe93a, fontFamily: _fontFamily);
  static const IconData posF = IconData(0xe93b, fontFamily: _fontFamily);
  static const IconData pos = IconData(0xe93c, fontFamily: _fontFamily);
  static const IconData reload = IconData(0xe93d, fontFamily: _fontFamily);
  static const IconData save = IconData(0xe93e, fontFamily: _fontFamily);
  static const IconData search = IconData(0xe93f, fontFamily: _fontFamily);
  static const IconData sendF = IconData(0xe940, fontFamily: _fontFamily);
  static const IconData send = IconData(0xe941, fontFamily: _fontFamily);
  static const IconData settingF = IconData(0xe942, fontFamily: _fontFamily);
  static const IconData setting = IconData(0xe943, fontFamily: _fontFamily);
  static const IconData share = IconData(0xe944, fontFamily: _fontFamily);
  static const IconData shrinkA1 = IconData(0xe945, fontFamily: _fontFamily);
  static const IconData shrinkA2 = IconData(0xe946, fontFamily: _fontFamily);
  static const IconData shrinkD1 = IconData(0xe947, fontFamily: _fontFamily);
  static const IconData shrinkD2 = IconData(0xe948, fontFamily: _fontFamily);
  static const IconData shrinkH = IconData(0xe949, fontFamily: _fontFamily);
  static const IconData shrinkV = IconData(0xe94a, fontFamily: _fontFamily);
  static const IconData starF = IconData(0xe94b, fontFamily: _fontFamily);
  static const IconData star = IconData(0xe94c, fontFamily: _fontFamily);
  static const IconData sunF = IconData(0xe94d, fontFamily: _fontFamily);
  static const IconData sun = IconData(0xe94e, fontFamily: _fontFamily);
  static const IconData tagF = IconData(0xe94f, fontFamily: _fontFamily);
  static const IconData tag = IconData(0xe950, fontFamily: _fontFamily);
  static const IconData trashF = IconData(0xe951, fontFamily: _fontFamily);
  static const IconData trash = IconData(0xe952, fontFamily: _fontFamily);
  static const IconData unlockedF = IconData(0xe953, fontFamily: _fontFamily);
  static const IconData unlocked = IconData(0xe954, fontFamily: _fontFamily);
  static const IconData userF = IconData(0xe955, fontFamily: _fontFamily);
  static const IconData user = IconData(0xe956, fontFamily: _fontFamily);
  static const IconData warn = IconData(0xe957, fontFamily: _fontFamily);
}

class InsdTheme {
  InsdTheme._();

  static ThemeData get dark => ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          extensions: <ThemeExtension<dynamic>>[
            InsdSemanticColors(
              textMain: _darkAbsoluteColors.solid.gray(100),
              textPassive1: _darkAbsoluteColors.solid.gray(65),
              textPassive2: _darkAbsoluteColors.solid.gray(50),
              textPassive3: _darkAbsoluteColors.solid.gray(35),
              boxBackground: _darkAbsoluteColors.solid.gray(0),
              boxOverlay: _darkAbsoluteColors.alpha.dark(65),
              boxForeground1: _darkAbsoluteColors.solid.gray(8),
              boxForeground2: _darkAbsoluteColors.solid.gray(5),
              boxForeground3: _darkAbsoluteColors.solid.gray(2),
              boxBorder1: _darkAbsoluteColors.solid.gray(25),
              boxBorder2: _darkAbsoluteColors.solid.gray(20),
              boxBorder3: _darkAbsoluteColors.solid.gray(15),
              boxFilled1: _darkAbsoluteColors.alpha.dark(8),
              boxFilled2: _darkAbsoluteColors.alpha.dark(5),
              boxFilled3: _darkAbsoluteColors.alpha.dark(2),
              secondaryRed: _darkAbsoluteColors.solid.red(100),
              secondaryYellow: _darkAbsoluteColors.solid.yellow(100),
              secondaryGreen: _darkAbsoluteColors.solid.green(100),
              secondaryBlue: _darkAbsoluteColors.solid.blue(100),
            ),
            InsdAbsoluteColors(
              solidGray: _darkAbsoluteColors.solid.gray,
              solidRed: _darkAbsoluteColors.solid.red,
              solidYellow: _darkAbsoluteColors.solid.yellow,
              solidGreen: _darkAbsoluteColors.solid.green,
              solidBlue: _darkAbsoluteColors.solid.blue,
              alphaGray: _darkAbsoluteColors.alpha.dark,
              alphaInverse: _darkAbsoluteColors.alpha.light,
            ),
          ]);

  static ThemeData get light => ThemeData.light().copyWith(
          brightness: Brightness.light,
          extensions: <ThemeExtension<dynamic>>[
            InsdSemanticColors(
              textMain: _lightAbsoluteColors.solid.gray(100),
              textPassive1: _lightAbsoluteColors.solid.gray(65),
              textPassive2: _lightAbsoluteColors.solid.gray(50),
              textPassive3: _lightAbsoluteColors.solid.gray(35),
              boxBackground: _lightAbsoluteColors.solid.gray(0),
              boxOverlay: _darkAbsoluteColors.alpha.light(65),
              boxForeground1: _lightAbsoluteColors.solid.gray(8),
              boxForeground2: _lightAbsoluteColors.solid.gray(5),
              boxForeground3: _lightAbsoluteColors.solid.gray(2),
              boxBorder1: _lightAbsoluteColors.solid.gray(25),
              boxBorder2: _lightAbsoluteColors.solid.gray(20),
              boxBorder3: _lightAbsoluteColors.solid.gray(15),
              boxFilled1: _lightAbsoluteColors.alpha.light(8),
              boxFilled2: _lightAbsoluteColors.alpha.light(5),
              boxFilled3: _lightAbsoluteColors.alpha.light(2),
              secondaryRed: _lightAbsoluteColors.solid.red(100),
              secondaryYellow: _lightAbsoluteColors.solid.yellow(100),
              secondaryGreen: _lightAbsoluteColors.solid.green(100),
              secondaryBlue: _lightAbsoluteColors.solid.blue(100),
            ),
            InsdAbsoluteColors(
              solidGray: _lightAbsoluteColors.solid.gray,
              solidRed: _lightAbsoluteColors.solid.red,
              solidYellow: _lightAbsoluteColors.solid.yellow,
              solidGreen: _lightAbsoluteColors.solid.green,
              solidBlue: _lightAbsoluteColors.solid.blue,
              alphaGray: _lightAbsoluteColors.alpha.light,
              alphaInverse: _lightAbsoluteColors.alpha.dark,
            ),
          ]);
}
