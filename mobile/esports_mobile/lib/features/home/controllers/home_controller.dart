import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/announcement_model.dart';
import '../../../core/models/game_model.dart';

class HomeController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<AnnouncementModel> listAnnouncements = [];
  List<AnnouncementModel> listUnicAnnouncements = [];
  List<GameModel> listGames = [];

  getAllGames() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('games').get();

    for (var item in snapshot.docs) {
      listGames.add(GameModel.fromMap(item.data()));
    }
  }

  getAllAnnouncements() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('announcements').get();
    listAnnouncements = [];
    listUnicAnnouncements = [];
    for (var item in snapshot.docs) {
      AnnouncementModel announcement = AnnouncementModel.fromJson(item.data());
      if (!listAnnouncements
          .any((element) => element.nameGame == announcement.nameGame)) {
        listUnicAnnouncements.add(announcement);
      }
      listAnnouncements.add(announcement);
    }
    return true;
  }

  String getImage(int index) {
    return listGames
        .where(
            (element) => element.name == listUnicAnnouncements[index].nameGame)
        .first
        .pathImage;
  }

  int numAnnouncements(AnnouncementModel announcement) {
    int count = 0;
    for (var item in listAnnouncements) {
      if (item.nameGame == announcement.nameGame) {
        count++;
      }
    }
    return count;
  }
}
