# Raffle app

This is a simple demo app to showcase the utilities of Flutter.

## Getting Started

Under `lib/constant` should be present a file called `Secrets.dart` that contain the link for the desired meetup and the authorization key. This file is on `.gitignore` for security reasons. 

The file should look like:

```dart

class Secrets {
  static const String ApiKey = "2a171e7b6948521e142f60695a255522";

  static const String MeetupURL =
      "https://api.meetup.com/<meetup_name>/events/<event_id>/rsvps?photo-host=public&sig_id=195653046&sig=<secret_id>";
}


```
