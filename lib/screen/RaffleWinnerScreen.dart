import 'package:flutter/material.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:raffle/view/TitleText.dart';

class RaffleWinnerScreen extends StatelessWidget {
  final Contestant winner;

  RaffleWinnerScreen(this.winner);

  Widget _photoContainer() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Hero(
        tag: winner.photoURL,
        child: Container(
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(
                boxShadow: [new BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    color: Colors.black26
                )],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        winner.photoURL)
                )
            )),
      ),
    );
  }

  Widget _nameContainer() {
    return BoldTitleText(winner.name, Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('And the grand winner is'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _photoContainer(),
            _nameContainer()
          ],
        ),
      ),
    );
  }
}
