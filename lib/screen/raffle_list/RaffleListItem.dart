import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/model/Contestant.dart';

abstract class RaffleListItem {}

class RaffleContestantItem extends RaffleListItem {
  Contestant contestant;

  RaffleContestantItem(this.contestant): super();

  Widget _cardContent() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.black26))),
        child: Hero(
          tag: contestant.photoURL,
          child: Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                          contestant.photoURL)
                  )
              )),
        ),
      ),
      title: Text(
        contestant.name,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text("u/${contestant.identifier}", style: TextStyle(color: Colors.black))
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: _cardContent(),
      ),
    );
  }
}

class ExecuteRaffleItem extends RaffleListItem {
  Widget build(BuildContext context, VoidCallback onPressed) {
    return  Container(
      padding: EdgeInsets.all(20),
      child: RaisedButton(
        color: Colors.blue,
          child: Text("Raffle it!", style: TextStyle(color: Colors.white),),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
      ),
    );
  }
}

