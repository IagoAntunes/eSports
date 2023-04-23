import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web/src/models/announcement_model.dart';

import '../models/game_model.dart';
import '../widgets/card_info_widget.dart';
import '../widgets/list_games_ad_widget.dart';
import '../widgets/title_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameModel> listGames = [];
  List<AnnouncementModel> listAnnouncements = [];
  List<AnnouncementModel> listUnicos = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late StreamSubscription listener;
  @override
  void initState() {
    super.initState();
    _getGames();
    addListeners();
  }

  _getGames() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('games').get();

    for (var game in snapshot.docs) {
      listGames.add(GameModel.fromMap(game.data()));
    }
  }

  void addListeners() async {
    listener =
        firestore.collection('announcements').snapshots().listen((snapshot) {
      getAll();
    });
  }

  getAll() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('announcements').get();
    listAnnouncements = [];
    listUnicos = [];
    for (var game in snapshot.docs) {
      AnnouncementModel announcement = AnnouncementModel.fromJson(game.data());
      if (listAnnouncements
          .any((item) => item.nameGame == announcement.nameGame)) {
      } else {
        listUnicos.add(announcement);
      }
      listAnnouncements.add(announcement);
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.png'),
                const SizedBox(height: 50),
                const TitleHomeWidget(),
                const SizedBox(height: 30),
                ListGamesAdWidget(
                  size: size,
                  listAnnouncements: listAnnouncements,
                  listGames: listGames,
                  listUnicAnnouncements: listUnicos,
                ),
                SizedBox(height: size.height * 0.05),
                CardInfoWidget(size: size, listGames: listGames)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
