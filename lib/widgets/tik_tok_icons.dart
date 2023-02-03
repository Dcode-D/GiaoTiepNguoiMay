import 'package:flutter/material.dart';

class TikTokIcons{
  TikTokIcons._();

  static const _fontFamily = 'TikTokIcons';

  static const IconData chat_bubble = IconData(0xe808, fontFamily: _fontFamily);
  static const IconData create = IconData(0xe809, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe80a, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe80b, fontFamily: _fontFamily);
  static const IconData messages = const IconData(0xe80c, fontFamily: _fontFamily);
  static const IconData profile = const IconData(0xe80d, fontFamily: _fontFamily);
  static const IconData reply = const IconData(0xe80e, fontFamily: _fontFamily);
  static const IconData search = const IconData(0xe80f, fontFamily: _fontFamily);

  static const _kFontFam = 'CustomFlutterIcons';
  static const String? _kFontPkg = null;

  static const IconData paper_plane = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heart_blank = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heart_full = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}