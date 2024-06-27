
import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:flutter/material.dart';

class TextStyleComponent {
  static const String SOLEIL = 'SoleilW01';
  static const FontWeight SOLEIL_BOOK = FontWeight.w500;
  static const FontWeight SOLEIL_SEMI_BOLD = FontWeight.w600;
  // Black
  static const TextStyle boldBlack36 = TextStyle(
    color: Colors.black,
    fontFamily: SOLEIL,
    fontSize: 36,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle boldBlack24 = TextStyle(
    color: Colors.black,
    fontFamily: SOLEIL,
    fontSize: 24,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle boldOrange22 = TextStyle(
    color: Color(0XFFEB7F00),
    fontFamily: SOLEIL,
    fontSize: 22,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle boldBlack20 = TextStyle(
    color: Colors.black,
    fontFamily: SOLEIL,
    fontSize: 20,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle normalLightBlack12 = TextStyle(
    color: ColorCodes.cLightBlack,
    fontFamily: SOLEIL,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle boldBlack18 = TextStyle(
    color: Colors.black,
    fontFamily: SOLEIL,
    fontSize: 18,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle boldBlack16 = TextStyle(
      color: Colors.black,
      fontFamily: SOLEIL,
      fontSize: 16,
      fontWeight: SOLEIL_SEMI_BOLD);

  static const TextStyle boldBlack14 = TextStyle(
      color: Colors.black,
      fontFamily: SOLEIL,
      fontSize: 14,
      fontWeight: SOLEIL_SEMI_BOLD);

  static const TextStyle boldBlack12 = TextStyle(
      color: Colors.black,
      fontFamily: SOLEIL,
      fontSize: 12,
      fontWeight: SOLEIL_SEMI_BOLD);

  static const TextStyle normalBlack20 =
      TextStyle(color: Colors.black, fontFamily: SOLEIL, fontSize: 20);

  static const TextStyle normalBlack18 =
      TextStyle(color: Colors.black, fontFamily: SOLEIL, fontSize: 18);

  static const TextStyle bookBlack16 = TextStyle(
      color: Colors.black,
      fontFamily: SOLEIL,
      fontSize: 16,
      fontWeight: SOLEIL_BOOK);

  static const TextStyle bookBlack14 = TextStyle(
      color: Colors.black,
      fontFamily: SOLEIL,
      fontSize: 14,
      fontWeight: SOLEIL_BOOK);

  static const TextStyle normalBlack12 =
      TextStyle(color: Colors.black, fontFamily: SOLEIL, fontSize: 12);

  static const TextStyle normalChatBlack12 =
      TextStyle(color: ColorCodes.chatText, fontFamily: SOLEIL, fontSize: 12);

  static const TextStyle normalBlack14 =
      TextStyle(color: Colors.black, fontFamily: SOLEIL, fontSize: 14);

  static const TextStyle normalBlack16 =
      TextStyle(color: Colors.black, fontFamily: SOLEIL, fontSize: 16);

  static const TextStyle w200Black12 = TextStyle(
    fontFamily: SOLEIL,
    fontSize: 12,
    fontWeight: FontWeight.w200,
  );

  // Grey
  static const TextStyle boldGrey14 = TextStyle(
      fontFamily: SOLEIL,
      fontSize: 14,
      color: ColorCodes.cGrey,
      fontWeight: SOLEIL_SEMI_BOLD);

  static const TextStyle normalGrey16 =
      TextStyle(fontFamily: SOLEIL, fontSize: 16, color: ColorCodes.cGrey);

  static const TextStyle normalGrey14 =
      TextStyle(fontFamily: SOLEIL, fontSize: 14, color: ColorCodes.cGrey);

  static const TextStyle normalLightGrey10 =
      TextStyle(fontFamily: SOLEIL, fontSize: 10, color: ColorCodes.cLightGrey);

  static const TextStyle normalLightGrey12 =
      TextStyle(fontFamily: SOLEIL, fontSize: 12, color: ColorCodes.cLightGrey);

  static const TextStyle normalDarkGrey14 =
      TextStyle(fontFamily: SOLEIL, fontSize: 14, color: ColorCodes.cDarkGrey);

  static const TextStyle boldDisabledGrey12 = TextStyle(
      fontFamily: SOLEIL,
      fontSize: 12,
      fontWeight: SOLEIL_SEMI_BOLD,
      color: ColorCodes.cDisabledGrey);

  static const TextStyle normalDisabledGrey10 = TextStyle(
      fontFamily: SOLEIL, fontSize: 10, color: ColorCodes.cDisabledGrey);

  static const TextStyle normalDisabledGrey16 = TextStyle(
      fontFamily: SOLEIL,
      fontSize: 16,
      fontWeight: SOLEIL_SEMI_BOLD,
      color: ColorCodes.cDisabledGrey);

  // White
  static const TextStyle boldWhite20 = TextStyle(
      fontFamily: SOLEIL,
      color: Colors.white,
      fontSize: 20,
      fontWeight: SOLEIL_SEMI_BOLD);

  static const TextStyle normalWhite14 =
      TextStyle(fontFamily: SOLEIL, fontSize: 14, color: Colors.white);

  static const TextStyle normalWhite12 =
      TextStyle(fontFamily: SOLEIL, fontSize: 12, color: Colors.white);

  // Purple
  static const TextStyle boldPurple14 = TextStyle(
    color: ColorCodes.cPurple,
    fontSize: 14,
    fontFamily: SOLEIL,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle boldPurple16 = TextStyle(
    color: ColorCodes.cPurple,
    fontSize: 16,
    fontFamily: SOLEIL,
    fontWeight: SOLEIL_SEMI_BOLD,
  );

  static const TextStyle normalMediumPurple10 = TextStyle(
      fontFamily: SOLEIL, fontSize: 10, color: ColorCodes.cMediumPurple);

  static const TextStyle normalPurple14 =
      TextStyle(fontFamily: SOLEIL, fontSize: 14, color: ColorCodes.cPurple);

  static const TextStyle normalPurple16 =
      TextStyle(fontFamily: SOLEIL, fontSize: 16, color: ColorCodes.cPurple);

  // Red
  static const TextStyle normalRed12 =
      TextStyle(fontFamily: SOLEIL, fontSize: 12, color: Colors.red);

  // Orange
  static const TextStyle bookOrange12 = TextStyle(
      color: ColorCodes.cOrange,
      fontFamily: SOLEIL,
      fontSize: 12,
      fontWeight: SOLEIL_BOOK);

  // Green
  static const TextStyle bookGreen12 = TextStyle(
      color: ColorCodes.cGreen,
      fontFamily: SOLEIL,
      fontSize: 12,
      fontWeight: SOLEIL_BOOK);

  //Dynamic sizes

  static TextStyle dBoldBlack({required double fontSize}) => TextStyle(
        color: Colors.black,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dBoldBlackAlt({required double fontSize}) => TextStyle(
        color: Colors.black,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dHint({required double fontSize}) => TextStyle(
        color: ColorCodes.cGrey,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dWhiteHint({required double fontSize}) => TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontFamily: SOLEIL,
        fontSize: fontSize,
      );
  static TextStyle dNormalBlack({required double fontSize}) => TextStyle(
        color: Colors.black,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
  static TextStyle dBookBlack({required double fontSize}) => TextStyle(
        color: Colors.black,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_BOOK,
      );
  static TextStyle dNormalBlackSemiBold({required double fontSize}) =>
      TextStyle(
        color: Colors.black,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dNormalGrey({required double fontSize}) => TextStyle(
        color: ColorCodes.cGrey,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
  static TextStyle dNormalGreyBold({required double fontSize}) => TextStyle(
        color: ColorCodes.cGrey,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dNormalGreyUnderline({required double fontSize}) =>
      TextStyle(
        color: ColorCodes.cGrey,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
      );
  static TextStyle dNormalRed({required double fontSize, double? height}) =>
      TextStyle(
        color: ColorCodes.cErrorRed,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        height: height,
        fontWeight: FontWeight.normal,
      );
  static TextStyle dBoldRed({required double fontSize, double? height}) =>
      TextStyle(
        color: ColorCodes.cErrorRed,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        height: height,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dBluePurple({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle dBookBluePurple({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_BOOK,
      );
  static TextStyle dBluePurpleStrike({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorCodes.cAccentRed,
        fontWeight: FontWeight.normal,
      );
  static TextStyle dBluePurpleBold({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dBluePurpleSemiBold({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dBluePurpleDisabled({required double fontSize}) => TextStyle(
        color: ColorCodes.cBluePurple.withOpacity(0.5),
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
  static TextStyle dBoldBluePurpleUnderline({required double fontSize}) =>
      TextStyle(
        color: ColorCodes.cBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        decoration: TextDecoration.underline,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dBoldLightBluePurple({required double fontSize}) =>
      TextStyle(
        color: ColorCodes.cLightBluePurple,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
      );
  static TextStyle dNormalWhite({required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: FontWeight.normal,
          color: Colors.white);
  static TextStyle dNormalPinkAccent(
          {required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: FontWeight.normal,
          color: ColorCodes.cIntermediateGradient1);
  static TextStyle dNormalOrangeAccent(
          {required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: FontWeight.normal,
          color: ColorCodes.cOrange);
  static TextStyle dBoldOrangeAccent(
          {required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: SOLEIL_SEMI_BOLD,
          color: ColorCodes.cOrange);
  static TextStyle dSemiBoldWhite({required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: SOLEIL_SEMI_BOLD,
          color: Colors.white);
  static TextStyle dBookWhite({required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          fontWeight: SOLEIL_BOOK,
          color: Colors.white);
  static TextStyle dNormalWhiteStrike(
          {required double fontSize, double? height}) =>
      TextStyle(
          fontFamily: SOLEIL,
          fontSize: fontSize,
          height: height,
          decoration: TextDecoration.lineThrough,
          decorationColor: ColorCodes.cAccentRed,
          fontWeight: FontWeight.normal,
          color: Colors.white);
  static TextStyle dBoldWhite({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: SOLEIL_SEMI_BOLD,
      color: Colors.white);

  static TextStyle dNormalLightGrey({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: ColorCodes.cLightGrey);

  static TextStyle dNormalDarkGrey({required double fontSize}) => TextStyle(
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: ColorCodes.cAccentGrey,
      );
  static TextStyle dNormalDarkGrey2({required double fontSize}) => TextStyle(
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: ColorCodes.cTextGrey,
      );
  static TextStyle dBoldDarkGrey({required double fontSize}) => TextStyle(
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: SOLEIL_SEMI_BOLD,
        color: ColorCodes.cVeryDarkGrey,
      );
  static TextStyle dNormalDarkGrey3({required double fontSize}) => TextStyle(
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: ColorCodes.cVeryDarkGrey,
      );

  static TextStyle dNormalLightBlue({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: ColorCodes.cLightBlue);

  static TextStyle dNormalButtonGrey({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: ColorCodes.cButtonGrey);
  static TextStyle dBoldDarkOrange({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: SOLEIL_SEMI_BOLD,
      color: ColorCodes.cDarkOrange);
  static TextStyle dNormalOrangeBook({required double fontSize}) => TextStyle(
      fontFamily: SOLEIL,
      fontSize: fontSize,
      fontWeight: SOLEIL_BOOK,
      color: ColorCodes.cOrange);

  static TextStyle dNormalGreen({required double fontSize}) => TextStyle(
        color: ColorCodes.cGreen,
        fontFamily: SOLEIL,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );

  static TextStyle uTextStyle(
          {required double fontSize,
          required Color color,
          FontWeight? weight = FontWeight.normal,
          double letterSpacing = 0,
          TextDecoration? textDecoration,
          double? height}) =>
      TextStyle(
          color: color,
          fontFamily: SOLEIL,
          fontSize: fontSize,
          fontWeight: weight,
          letterSpacing: letterSpacing,
          height: height,
          decoration: textDecoration);
}