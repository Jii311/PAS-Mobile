// models/post_model.dart

class ApiModel {
  final String idTeam;
  final String strTeam;
  final String strBadge;


  bool isLiked;

  ApiModel(
      {required this.idTeam,
      required this.strTeam,
      required this.strBadge,

      this.isLiked = false});

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strBadge': strBadge,

      'isLiked': isLiked ? 1 : 0,
    };
  }

  // Convert a Map object into a Task object
  // dari database ke UI dalam bentuk object
  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      idTeam: map['idTeam'],
      strTeam: map['strTeam'],
      strBadge: map['strBadge'],

      isLiked: map['isLiked'] == 1,
    );
  }

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      idTeam: json['idTeam'].toString(),
      strTeam: json['strTeam'],
      strBadge: json['strBadge'],

    );
  }
}
