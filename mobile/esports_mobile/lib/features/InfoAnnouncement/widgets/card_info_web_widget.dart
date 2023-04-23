import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/gradient_text.dart';

class CardInfoWeb extends StatelessWidget {
  const CardInfoWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: AppColors.greyDark,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: 0,
            child: Icon(
              Icons.sports_esports_outlined,
              color: AppColors.primaryPurple,
              size: 30,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GradientText(
                    ' duo ',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: const LinearGradient(colors: [
                      AppColors.purpleAccent,
                      AppColors.greenAccent,
                      AppColors.yellowAccent,
                    ]),
                  ),
                  Text(
                    "is here",
                    style: GoogleFonts.inter(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Register your announcement also on our website",
                style: GoogleFonts.inter(
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
