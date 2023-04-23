import 'package:esports_mobile/core/colors/app_colors.dart';
import 'package:esports_mobile/core/models/announcement_model.dart';
import 'package:esports_mobile/features/InfoAnnouncement/widgets/card_info_web_widget.dart';
import 'package:esports_mobile/features/InfoAnnouncement/widgets/list_people_announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAnnouncemente extends StatelessWidget {
  const InfoAnnouncemente({
    super.key,
    required this.listAnnouncement,
    required this.pathImage,
  });
  final List<AnnouncementModel> listAnnouncement;
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.cover,
          width: 100,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, right: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardInfoWeb(),
              const SizedBox(height: 30),
              Text(
                listAnnouncement.first.nameGame,
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Text(
                "Log in and start playing!",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyMed,
                ),
              ),
              const SizedBox(height: 30),
              ListPeopleAnnuncement(listAnnouncement: listAnnouncement)
            ],
          ),
        ),
      ),
    );
  }
}
