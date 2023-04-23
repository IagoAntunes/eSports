import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esports_mobile/core/colors/app_colors.dart';
import 'package:esports_mobile/features/InfoAnnouncement/info_announcement_page.dart';
import 'package:esports_mobile/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/models/announcement_model.dart';
import 'widgets/loading_shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();
  @override
  void initState() {
    super.initState();
    homeController.getAllGames();
    addListeners();
  }

  StreamSubscription? listener;

  void addListeners() async {
    listener = homeController.firestore
        .collection('announcements')
        .snapshots()
        .listen((snapshot) {
      getAllAnnouncements();
    });
  }

  getAllAnnouncements() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await homeController.firestore.collection('announcements').get();
    homeController.listAnnouncements = [];
    homeController.listUnicAnnouncements = [];
    for (var item in snapshot.docs) {
      AnnouncementModel announcement = AnnouncementModel.fromJson(item.data());
      if (!homeController.listAnnouncements
          .any((element) => element.nameGame == announcement.nameGame)) {
        homeController.listUnicAnnouncements.add(announcement);
      }
      homeController.listAnnouncements.add(announcement);
    }
    setState(() {});
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
                "Find your duo!",
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              Text(
                "Select the game you want to play...",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffA1A1AA),
                ),
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                future: homeController.getAllAnnouncements(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 300,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.listUnicAnnouncements.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoAnnouncemente(
                                  listAnnouncement: homeController
                                      .listAnnouncements
                                      .where((element) =>
                                          element.nameGame ==
                                          homeController
                                              .listUnicAnnouncements[index]
                                              .nameGame)
                                      .toList(),
                                  pathImage: homeController.getImage(index),
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
                                        homeController.getImage(index),
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
                                          homeController
                                              .listUnicAnnouncements[index]
                                              .nameGame,
                                          style: GoogleFonts.inter(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${homeController.numAnnouncements(homeController.listUnicAnnouncements[index])} announcement(s)",
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
                    return LoadingShimmerWidget(size: size);
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
