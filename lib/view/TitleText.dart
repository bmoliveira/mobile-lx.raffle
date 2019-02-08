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
  final Color _color;

  BoldTitleText(this._text, this._color);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: TextStyle(color: _color, fontSize: 40, fontWeight: FontWeight.bold),
              text: _text)),
    );
  }
}
