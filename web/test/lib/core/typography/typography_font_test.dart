import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web/core/typography/typography_font.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('test styles return if is a TEXTSTYLE', (() {
    expect(AppTypography.mediumText(), isA<TextStyle>());
    expect(AppTypography.textFieldStyle(), isA<TextStyle>());
    expect(AppTypography.titleStyle(), isA<TextStyle>());
  }));
}
