import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/models/announcement_model.dart';
import 'connect_button_widget.dart';

class ListPeopleAnnuncement extends StatelessWidget {
  const ListPeopleAnnuncement({
    super.key,
    required this.listAnnouncement,
  });

  final List<AnnouncementModel> listAnnouncement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: listAnnouncement.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Name",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.greyLight,
                ),
              ),
              Text(
                listAnnouncement[index].nickname,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Game Time",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.greyLight,
                ),
              ),
              Text(
                '${listAnnouncement[index].yearsPlayed} years',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Availability",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.greyLight,
                ),
              ),
              Text(
                '${listAnnouncement[index].daysPlayed.length} days  ${int.parse(listAnnouncement[index].startTime.split(':').first)}h - ${int.parse(listAnnouncement[index].endTime.split(':').first)}h',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Audio call ?",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.greyLight,
                ),
              ),
              Text(
                listAnnouncement[index].hasVoiceChat ? 'Yes' : 'No',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: listAnnouncement[index].hasVoiceChat
                      ? AppColors.greenAccent
                      : AppColors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox()),
              ConnectButton(
                listAnnouncement: listAnnouncement,
                index: index,
              )
            ],
          ),
        ),
      ),
    );
  }
}
