import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/models/announcement_model.dart';

class DialogPlay extends StatelessWidget {
  const DialogPlay({
    super.key,
    required this.listAnnouncement,
    required this.index,
  });
  final int index;
  final List<AnnouncementModel> listAnnouncement;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(12),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: AppColors.greyDark,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 90,
                      color: AppColors.customGreen,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Let\' play',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Now just start playing!",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: AppColors.greyMed,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Add to Discord',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: AppColors.greyDark2,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            4,
                          ),
                        ),
                      ),
                      child: SelectableText(
                        listAnnouncement[index].idDiscord,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: AppColors.greyLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
