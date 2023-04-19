import 'package:flutter/material.dart'; // importando a classe TimeOfDay do pacote flutter

class GamePlayer {
  String nameGame;
  String nickname;
  String yearsPlayed;
  String idDiscord;
  List<int> daysPlayed;
  TimeOfDay hourDay;
  bool hasVoiceChat;

  GamePlayer({
    required this.nameGame,
    required this.nickname,
    required this.yearsPlayed,
    required this.idDiscord,
    required this.daysPlayed,
    required this.hourDay,
    required this.hasVoiceChat,
  });

  // Método factory para criar uma instância da classe a partir de um mapa JSON
  factory GamePlayer.fromJson(Map<String, dynamic> json) {
    return GamePlayer(
      nameGame: json['nameGame'],
      nickname: json['nickname'],
      yearsPlayed: json['yearsPlayed'],
      idDiscord: json['idDiscord'],
      daysPlayed: json['daysPlayed']
          .cast<int>(), // converter a lista de dynamic para List<int>
      hourDay: TimeOfDay(
        hour: json['hourDay']['hour'],
        minute: json['hourDay']['minute'],
      ),
      hasVoiceChat: json['hasVoiceChat'],
    );
  }

  // Método para converter a instância da classe para um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'nameGame': nameGame,
      'nickname': nickname,
      'yearsPlayed': yearsPlayed,
      'idDiscord': idDiscord,
      'daysPlayed': daysPlayed,
      'hourDay': {
        'hour': hourDay.hour,
        'minute': hourDay.minute,
      },
      'hasVoiceChat': hasVoiceChat,
    };
  }
}
