// ignore_for_file: unnecessary_this

import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/app_singleton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizeParsingInt on num {
  /// Returns a double, which is calculated as
  ///
  /// (Screen Height) * (input / Average Screen Height)
  ///
  /// Default Average Screen Height = 720
  double get hWise => ((AppContext.dHeight ?? 720) * (this / 720));

  /// Returns a double, which is calculated as
  ///
  /// (Screen Width) * (input / Average Screen Width)
  ///
  /// Default Average Screen Width = 360
  double get wWise => ((AppContext.dWidth ?? 360) * (this / 360));

  /// Creates a Sizedbox of [this] height
  SizedBox get hGap => SizedBox(height: this.hWise);

  /// Creates a Sizedbox of [this] width
  SizedBox get wGap => SizedBox(width: this.wWise);

  ///Circular Border radius
  BorderRadius get cBorderRadius => BorderRadius.circular(this.toDouble());

  String get getDateStringFromMSE => DateFormat('dd MMM, hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(this.toInt()),
      );

  String get getShortDateStringFromMSE => DateFormat('dd MMM, yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(this.toInt()),
      );

  DateTime get getDateFromMSE =>
      DateTime.fromMillisecondsSinceEpoch(this.toInt());
}

extension MyExtenionWidget on Widget {
  MaterialPage get inMPage => MaterialPage(child: this);
}

extension MyExtenionColor on String {
  /// Makes [Color] from String.
  /// Will throw an error if String length is not 3 or 6
  Color get hexColor {
    assert(
        this.length == 6 || this.length == 3, 'hex code length must be 3 or 6');
    return Color(int.parse('0xFF$this'));
  }

  Text createText({
    double fontSize = 14,
    Color? color,
    bool isBold = false,
    bool isCenterAligned = false,
    bool handleOverflow = false,
    int? maxLines,
  }) {
    return Text(
      this,
      textAlign: isCenterAligned ? TextAlign.center : TextAlign.start,
      overflow: handleOverflow ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      style: TextStyleComponent.uTextStyle(
          fontSize: fontSize.hWise,
          color: color ?? ColorCodes.cGreyBlack,
          weight: isBold ? FontWeight.w600 : FontWeight.normal),
    );
  }

  String get toCamelCase {
    assert(this.isNotEmpty, 'String is empty');
    return this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
  }
}

extension MyExtenionList on List<String> {
  /// Returns a Query string from list of String.
  ///
  /// Example = ["id=1","code=528"] => "&id=1&code=528"
  String get makeQuery {
    String _query = '';
    this.forEach((query) {
      _query = '$_query&$query';
    });
    return _query;
  }

  String separateBy(String separator) {
    if (this.isNull) return '';
    String toRet = '';
    for (var i = 0; i < this.length; i++) {
      toRet += this[i];
      if (i != this.length - 1) {
        toRet += '$separator';
      }
    }
    return toRet;
  }
}

extension MyExtentionAllList on List? {
  bool get isNullOrEmpty => this.isNull || this!.isEmpty;
}

extension MyExtenionContext on BuildContext {
  /// Size of screen
  Size get size => MediaQuery.of(this).size;

  /// Height of screen
  double get height => MediaQuery.of(this).size.height;

  /// Width of screen
  double get width => MediaQuery.of(this).size.width;

  /// Height of Keyboard
  double get kHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Check if Keyboard is visible.
  bool get kVisible => MediaQuery.of(this).viewInsets.bottom != 0;

  /// Pop
  void pop<T extends Object>([T? results]) => Navigator.of(this).pop(results);

  ///push
  Future<T?> push<T extends Object>(Widget page) =>
      Navigator.of(this).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease)).animate(animation),
            child: child,
          );
        },
      ));

  /// PushReplace
  Future<T?> pushReplace<T extends Object, TO extends Object>(Widget page,
          {TO? result, bool isBack = false}) =>
      Navigator.of(this).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(isBack ? -1 : 1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease)).animate(animation),
                child: child,
              );
            },
          ),
          result: result);

  Future<T?> pushAndRemoveUntil<T extends Object, TO extends Object>(
          Widget page, bool Function(Route<dynamic>) predicate,
          {bool isBack = false}) =>
      Navigator.of(this).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(isBack ? -1 : 1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.ease)).animate(animation),
                child: child,
              );
            },
          ),
          predicate);
}

extension MyExtensionWidget on Widget {
  GestureDetector onTap(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Padding paddO({double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: this,
    );
  }

  Padding paddS({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      ),
      child: this,
    );
  }

  Align get alignCR {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Align get alignCL {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Align get alignC {
    return Center(
      child: this,
    );
  }

  Align get alignBR {
    return Align(
      alignment: Alignment.bottomRight,
      child: this,
    );
  }

  Align get alignBL {
    return Align(
      alignment: Alignment.bottomLeft,
      child: this,
    );
  }

  Align get alignBC {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }

  Align get alignTR {
    return Align(
      alignment: Alignment.topRight,
      child: this,
    );
  }

  Align get alignTL {
    return Align(
      alignment: Alignment.topLeft,
      child: this,
    );
  }

  Align get alignTC {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }
}

extension MyExtensionObject on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension StringExtension on String {
  String camelcase() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension DateExtension on DateTime {
  bool get isToday {
    return this.difference(DateTime.now()).inDays == 0;
  }

  bool get isYesterday {
    return this.difference(DateTime.now()).inDays == -1;
  }

  bool hasSameDay(DateTime date) {
    return this.day == date.day &&
        this.month == date.month &&
        this.year == date.year;
  }
}