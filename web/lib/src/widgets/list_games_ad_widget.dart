import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/src/models/announcement_model.dart';
import 'package:web/src/models/game_model.dart';

import '../../core/colors/app_colors.dart';

class ListGamesAdWidget extends StatelessWidget {
  const ListGamesAdWidget({
    Key? key,
    required this.size,
    required this.listAnnouncements,
    required this.listGames,
  }) : super(key: key);

  final Size size;
  final List<AnnouncementModel> listAnnouncements;
  final List<GameModel> listGames;

  String _getImage(int index) {
    return listGames
        .where((element) => element.name == listAnnouncements[index].nameGame)
        .first
        .pathImage;
  }

  _numAnnouncements(int index) {
    return listGames
        .where((element) => element.name == listAnnouncements[index].nameGame)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    print(listAnnouncements);
    return SizedBox(
      height: size.height * 0.25,
      width: size.width / 1.5,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listAnnouncements.length,
        itemBuilder: (context, index) => Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.black, AppColors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
                _getImage(index),
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                width: 143,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      listAnnouncements[index].nameGame,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${_numAnnouncements(index)} anuncio(s)",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
