import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:raffle/constant/Secrets.dart';
import 'package:raffle/model/Contestant.dart';

class Constants {

  static Future<http.Response> _fetchContestants() {
    return http.get(Secrets.MeetupURL);
  }

  static Future<List<Contestant>> fetchContestants() async {
    final response = await _fetchContestants();

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      final values = json.decode(response.body);
      return values.map((value) => Contestant.fromJson(value)).cast<Contestant>().toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
