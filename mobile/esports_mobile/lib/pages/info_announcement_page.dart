import 'package:esports_mobile/core/colors/app_colors.dart';
import 'package:esports_mobile/models/announcement_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/widgets/gradient_text.dart';

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
              Container(
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
                              "Seu",
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
                              "está aqui",
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
                          "Cadastre seu anuncio tambem em nosso site",
                          style: GoogleFonts.inter(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
                "Conecte-se e comece a jogar!",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyMed,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
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
                          "Nome",
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
                          "Tempo de Jogo",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.greyLight,
                          ),
                        ),
                        Text(
                          '${listAnnouncement[index].yearsPlayed} anos',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Disponibilidade",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.greyLight,
                          ),
                        ),
                        Text(
                          listAnnouncement[index].hourDay.hour.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Chamada de áudio ?",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppColors.greyLight,
                          ),
                        ),
                        Text(
                          listAnnouncement[index].hasVoiceChat ? 'Sim' : 'Não',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: listAnnouncement[index].hasVoiceChat
                                ? AppColors.greenAccent
                                : AppColors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Material(
                                    type: MaterialType.transparency,
                                    child: Center(
                                      child: StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                          padding: const EdgeInsets.all(30),
                                          margin: const EdgeInsets.all(12),
                                          width: double.infinity,
                                          height: 400,
                                          decoration: BoxDecoration(
                                              color: AppColors.greyDark,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
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
                                                  "Agora é só começar a jogar!",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors.greyLight,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  'Adicione no Discord',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.greyDark2,
                                                  ),
                                                  child: Text(
                                                    listAnnouncement[index]
                                                        .idDiscord,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: AppColors.primaryPurple,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.videogame_asset),
                                Text("Conectar")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
