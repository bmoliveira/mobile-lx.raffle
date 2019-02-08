
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:raffle/screen/raffle_list/RaffleListItem.dart';

class RaffleScreenViewModel {
  List<Contestant> contestants;
  ViewModelState<RaffleScreenViewState> state;

  RaffleScreenViewModel({Key key, contestants}) : assert(contestants != null) {
    contestants
        .retainWhere((contestant) { return contestant.hasConfirmed && !contestant.isOrganizer; });

    this.contestants = contestants;

    state = ViewModelState(RaffleUserList(contestants));
  }

  Future<int> raffle() async {
    return Random().nextInt(contestants.length-1);
  }
}


abstract class RaffleScreenViewState {}

class RaffleUserList extends RaffleScreenViewState {
  List<Contestant> _contestants;

  List<RaffleListItem> items;

  RaffleUserList(this._contestants)
      : assert(_contestants != null),
        super() {

    final contestantItems = _contestants.map((contestant) => RaffleContestantItem(contestant));
    items = <RaffleListItem>[ExecuteRaffleItem()] + contestantItems.toList(growable: false);
  }
}
