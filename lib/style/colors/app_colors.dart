import 'package:flutter/material.dart';

class AppColors {
  // main color
  Color primary = HexColor.fromHex('#DBBA44'); // gold
  Color primaryOpacity25 = HexColor.fromHex('#DBBA44'); // gold opacity .25

  // generally color
  Color background = HexColor.fromHex("#E5E5E5"); // grey opacity
  Color grey = HexColor.fromHex("#424242");
  Color white = HexColor.fromHex("#FFFFFF");
  Color black800 = HexColor.fromHex("#262626");
  Color black54 = Colors.black54;
  Color black = HexColor.fromHex('#000000');
  Color errorColor = HexColor.fromHex("#FF1616");
  Color red = HexColor.fromHex('#F33737'); // red

  // new color
  Color darkIcon = HexColor.fromHex("#353535");
  Color primaryOpacity50 = HexColor.fromHex("#DBBA44");
  Color lightGrey = HexColor.fromHex('#BDBDBD');
  Color darkGrey = HexColor.fromHex("#8d8f8f");

  Color deliveryColor = HexColor.fromHex("#4DAE65");
  Color discountColor = HexColor.fromHex('#49CB34');
  Color textGrey = HexColor.fromHex('#5A5A5A');
  Color buttonRegisterGrey = HexColor.fromHex('#E0E0E0');
  Color green = HexColor.fromHex('#27C700');
  Color lightPink = HexColor.fromHex('#FFBFBF');
  Color transparent = Colors.transparent;

  // real estate color
  Color bookedColor = HexColor.fromHex('#FFD84E');
  Color soldOutColor = HexColor.fromHex('#FF1515');

  // sale list status color
  Color approvedColor = HexColor.fromHex('#29AF13'); // green
  Color confirmedColor = HexColor.fromHex('#27C700'); // green
  Color rejectedCancelledColor = HexColor.fromHex('#F33737'); // red
  Color pendingCompletedColor = HexColor.fromHex('#2C7BF1'); // blue
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 character with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
