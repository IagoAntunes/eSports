class AnnouncementModel {
  String id;
  String nameGame;
  String nickname;
  String yearsPlayed;
  String idDiscord;
  String startTime;
  String endTime;
  List<int> daysPlayed;
  bool hasVoiceChat;

  AnnouncementModel({
    required this.id,
    required this.nameGame,
    required this.nickname,
    required this.yearsPlayed,
    required this.idDiscord,
    required this.startTime,
    required this.endTime,
    required this.daysPlayed,
    required this.hasVoiceChat,
  });

  // Método factory para criar uma instância da classe a partir de um mapa JSON
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'],
      nameGame: json['nameGame'],
      nickname: json['nickname'],
      yearsPlayed: json['yearsPlayed'],
      idDiscord: json['idDiscord'],
      daysPlayed: json['daysPlayed'].cast<int>(),
      startTime: json['startTime'],
      endTime: json['endTime'],
      hasVoiceChat: json['hasVoiceChat'],
    );
  }

  // Método para converter a instância da classe para um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameGame': nameGame,
      'nickname': nickname,
      'yearsPlayed': yearsPlayed,
      'startTime': startTime,
      'endTime': endTime,
      'idDiscord': idDiscord,
      'daysPlayed': daysPlayed,
      'hasVoiceChat': hasVoiceChat,
    };
  }
}
