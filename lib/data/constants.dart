import 'package:flutter/material.dart';

enum EditMode {
  ADD,
  UPDATE,
}

// / Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(2), radix: 16) + 0xFF000000);
}
