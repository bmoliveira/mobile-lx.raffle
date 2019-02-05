import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:raffle/model/Contestant.dart';

class Constants {
  static const String MeetupURL =
      "https://api.meetup.com/mobile-lx/events/257922272/rsvps?photo-host=public&sig_id=195653046&sig=0da6f66e4786b87073176d09ab973c43b151c012";

  static Future<http.Response> _fetchContestants() {
    return http.get(MeetupURL);
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
