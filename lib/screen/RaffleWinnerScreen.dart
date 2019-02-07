import 'package:flutter/material.dart';
import 'package:raffle/model/Contestant.dart';

class RaffleWinnerScreen extends StatelessWidget {
  final Contestant winner;

  RaffleWinnerScreen(this.winner);

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
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Hero(
                tag: winner.photoURL,
                child: Container(
                    width: 160.0,
                    height: 160.0,
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
            ),
            Text(winner.name, style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
