import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';

class ApiService {
  final String _discoverUrl =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<List<ApiModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(_discoverUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> teamsJson = data['teams'];
      return teamsJson.map((json) => ApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
