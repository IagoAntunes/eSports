import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esports_mobile/core/colors/app_colors.dart';
import 'package:esports_mobile/models/announcement_model.dart';
import 'package:esports_mobile/models/game_model.dart';
import 'package:esports_mobile/pages/info_announcement_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<AnnouncementModel> listAnnouncements = [];
  List<GameModel> listGames = [];
  StreamSubscription? listener;
  @override
  void initState() {
    super.initState();
    _getAllGames();
  }

  _getAllAnnouncements() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('announcements').get();

    for (var item in snapshot.docs) {
      listAnnouncements.add(AnnouncementModel.fromJson(item.data()));
    }
    return true;
  }

  _getAllGames() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('games').get();

    for (var item in snapshot.docs) {
      listGames.add(GameModel.fromMap(item.data()));
    }
  }

  void addListeners() async {
    listener =
        firestore.collection('announcements').snapshots().listen((snapshot) {
      _getAllAnnouncements();
    });
  }

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Logo.png"),
              Text(
                "Encontre seu duo!",
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Text(
                "Selecione o game que deseja jogar...",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffA1A1AA),
                ),
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                future: _getAllAnnouncements(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listAnnouncements.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoAnnouncemente(
                                  listAnnouncement: listAnnouncements
                                      .where((element) =>
                                          element.nameGame ==
                                          listAnnouncements[index].nameGame)
                                      .toList(),
                                  pathImage: _getImage(index),
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.green,
                                      AppColors.black.withOpacity(0.4)
                                    ],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        _getImage(index),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    width: size.width * 0.5,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.black.withOpacity(0.0),
                                          AppColors.black.withOpacity(0.5),
                                          AppColors.black.withOpacity(0.8),
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          listAnnouncements[index].nameGame,
                                          style: GoogleFonts.inter(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${_numAnnouncements(index)} anuncio(s)",
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            color: AppColors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 300,
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.green,
                                      AppColors.black.withOpacity(0.4)
                                    ],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: Shimmer.fromColors(
                                  baseColor: AppColors.greyDark,
                                  highlightColor:
                                      AppColors.white.withOpacity(0.1),
                                  direction: ShimmerDirection.ltr,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: AppColors.greyDark,
                                    ),
                                    child: Container(
                                      width: size.width * 0.5,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.black.withOpacity(0.0),
                                            AppColors.black.withOpacity(0.5),
                                            AppColors.black.withOpacity(0.8),
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.red,
                                            ),
                                            child: Text(
                                              'wadwwadad',
                                              style: GoogleFonts.inter(
                                                fontSize: 20,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "anuncio(s)",
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              color: AppColors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
