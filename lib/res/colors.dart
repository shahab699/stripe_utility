import 'dart:ui';
class AppColors{

  static final Color white = HexColor.fromHex("#FFFFFF");
  static final Color mainColor = HexColor.fromHex("#FF634D");
  static final Color textColor = HexColor.fromHex("#4B4B4B");
  static final Color blackColor = HexColor.fromHex("#000000");
  static final Color lightOrangeColor = HexColor.fromHex("#F98878");
  static final Color mediumBlackTextColor = HexColor.fromHex("#292929");
  static final Color lightGrey = HexColor.fromHex("#EAE9E9");
  static final Color notificationColor = HexColor.fromHex("#FFE7E3");
  static final Color darkGreyTextColor = HexColor.fromHex("#707070");
  static final Color minorGrey = HexColor.fromHex("#F9F9F9");
  static final Color ratingButtonGrey = HexColor.fromHex(" #979797");

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}