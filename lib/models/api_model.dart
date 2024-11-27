// models/post_model.dart

class ApiModel {
  final String idTeam;
  final String strTeam;
  final String strBadge;
  final String strTeamAlternate;
  final String strLeague;
  final String strStadium;
  final String strLocation;
  final String strDescriptionEN;
  bool isLiked;

  ApiModel(
      {required this.idTeam,
      required this.strTeam,
      required this.strBadge,
      required this.strTeamAlternate,
      required this.strLeague, 
      required this.strStadium, 
      required this.strLocation, 
      required this.strDescriptionEN, 
      this.isLiked = false});

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strBadge': strBadge,
      'strTeamAlternate': strTeamAlternate,
      'strLeague': strLeague,
      'strStadium': strStadium,
      'strLocation': strLocation,
      'strDescriptionEN': strDescriptionEN,
      'isLiked': isLiked ? 1 : 0,
    };
  }

  // dari database ke UI dalam bentuk object
  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      idTeam: map['idTeam'],
      strTeam: map['strTeam'],
      strBadge: map['strBadge'],
      strTeamAlternate: map['strTeamAlternate'],
      strLeague: map['strLeague'],
      strStadium: map['strStadium'],
      strLocation: map['strLocation'],
      strDescriptionEN: map['strDescriptionEN'],
      isLiked: map['isLiked'] == 1,
    );
  }

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      idTeam: json['idTeam'].toString(),
      strTeam: json['strTeam'],
      strBadge: json['strBadge'],
      strTeamAlternate: json['strTeamAlternate'],
      strLeague: json['strLeague'],
      strStadium: json['strStadium'],
      strLocation: json['strLocation'],
      strDescriptionEN: json['strDescriptionEN'],
    );
  }
}
