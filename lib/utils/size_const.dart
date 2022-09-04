import 'package:flutter/material.dart';

class SizeConstants {
  static final screenheight = getscreenSize().height;
  static final double screenwidth = getscreenSize().width;
}

Size getscreenSize() {
  return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
}
