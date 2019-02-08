import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:raffle/constant/Secrets.dart';
import 'package:raffle/model/Contestant.dart';

class Constants {

  static final String defaultUserImage = "https://i.stack.imgur.com/l60Hf.png";

  static Future<http.Response> _fetchContestants() {
    return http.get(Secrets.MeetupURL);
  }

  static List<Contestant> manualUsers() {
    return <Contestant> [
      Contestant.hardCoded("Amadeu", "https://pluspng.com/img-png/user-png-icon-male-user-icon-512.png"),
      Contestant.hardCoded("Paula Gonçalves", "https://static.thenounproject.com/png/17241-200.png"),
      Contestant.hardCoded("Rui Vitória", defaultUserImage),
    ];
  }

  static Future<List<Contestant>> fetchContestants() async {
    final response = await _fetchContestants();

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      final values = json.decode(response.body);
      final result = values.map((value) => Contestant.fromJson(value))
          .cast<Contestant>()
          .toList();

      result.addAll(manualUsers());
      return result;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
