import 'package:flutter/widgets.dart';

class RegularTitleText extends StatelessWidget {
  final String _text;

  RegularTitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: TextStyle(fontSize: 40), text: _text)),
    );
  }
}

class BoldTitleText extends StatelessWidget {
  final String _text;

  BoldTitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              text: _text)),
    );
  }
}
