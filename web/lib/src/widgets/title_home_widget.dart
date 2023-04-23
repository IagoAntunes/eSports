import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/core/colors/app_colors.dart';
import 'package:web/core/typography/typography_font.dart';

import '../../core/widgets/gradient_text.dart';

class TitleHomeWidget extends StatelessWidget {
  const TitleHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your",
          style: AppTypography.titleStyle(),
        ),
        GradientText(
          ' duo ',
          style: AppTypography.titleStyle(),
          gradient: const LinearGradient(colors: [
            AppColors.purpleGradient1,
            AppColors.greenGradient1,
            AppColors.yellowGradient1,
          ]),
        ),
        Text(
          "is here",
          style: AppTypography.titleStyle(),
        ),
      ],
    );
  }
}
