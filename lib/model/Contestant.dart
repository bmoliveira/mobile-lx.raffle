import 'package:flutter/widgets.dart';

class Contestant {
  int identifier;
  String name;
  String photoURL;
  bool hasConfirmed;
  bool isOrganizer;

  static List<Contestant> defaultList = <Contestant>[
    Contestant(name: "Bruno"),
    Contestant(name: "Nuno"),
  ];

  Contestant(
      {Key key,
      this.identifier,
      this.name,
      this.photoURL,
      this.hasConfirmed,
      this.isOrganizer})
      : assert(name != null);

  factory Contestant.fromJson(Map<String, dynamic> json) {
    return Contestant(
        identifier: json["member"]["id"],
        name: json["member"]["name"],
        photoURL: json['member']["photo"]["photo_link"],
        isOrganizer: json['member']['event_context']['host'],
        hasConfirmed: (json['response'] as String).toLowerCase() == "yes");
  }
}
