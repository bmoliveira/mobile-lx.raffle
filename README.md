# Raffle app

This is a simple demo app to showcase the utilities of Flutter.

## Getting Started

Under `lib/constant` should be present a file called `Secrets.dart` that contain the link for the desired meetup and the authorization key. This file is on `.gitignore` for security reasons. 

The file should look like:

```dart

class Secrets {
  static const String ApiKey = "<api_key>";

  static const String MeetupURL =
      "https://api.meetup.com/<meetup_name>/events/<event_id>/rsvps?key=$ApiKey&sign=true";
}


```
