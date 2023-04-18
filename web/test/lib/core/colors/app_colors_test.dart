import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web/core/colors/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('color feedback test', (() {
    expect(AppColors.black, Colors.black);
    expect(AppColors.green, Colors.green);
    expect(AppColors.greyDark, const Color(0xff18181B));
    expect(AppColors.purple, const Color(0xff8B5CF6));
  }));
}
