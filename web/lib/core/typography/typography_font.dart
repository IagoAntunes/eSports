import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppTypography {
  static TextStyle titleStyle() {
    return GoogleFonts.inter(
      fontSize: 64,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textFieldStyle() {
    return GoogleFonts.inter(
      color: AppColors.greyText2,
      fontSize: 12,
    );
  }

  static TextStyle mediumText() {
    return GoogleFonts.inter(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}
