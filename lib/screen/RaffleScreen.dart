import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:scoped_model/scoped_model.dart';

class RaffleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ScopedModelDescendant<RaffleScreenViewModel>(
          builder: (context, child, viewModel) {
        final RaffleScreenViewState state = viewModel.state;
        if (state is RaffleUserList) {
          return _raffleUserList(state);
        } else if (state is RaffleExecutingRaffle) {
          return _raffleExecuting(state);
        } else if (state is RaffleWinner) {
          return _raffleWinner(state);
        }
      }),
    );
  }

  Widget _raffleUserList(RaffleUserList state) {
    return Text("User list");
  }

  Widget _raffleExecuting(RaffleExecutingRaffle state) {
    return Text("executing");
  }

  Widget _raffleWinner(RaffleWinner state) {
    return Text("winner!");
  }
}

abstract class RaffleScreenViewState {}

class RaffleUserList extends RaffleScreenViewState {
  List<Contestant> contestants;

  RaffleUserList({Key key, this.contestants})
      : assert(contestants != null),
        super();
}

class RaffleExecutingRaffle extends RaffleScreenViewState {
  List<Contestant> contestants;

  RaffleExecutingRaffle({Key key, this.contestants})
      : assert(contestants != null),
        super();
}

class RaffleWinner extends RaffleScreenViewState {
  Contestant winner;

  RaffleWinner({Key key, this.winner})
      : assert(winner != null),
        super();
}

class RaffleScreenViewModel extends Model {
  List<Contestant> _contestants;
  RaffleScreenViewState state;

  RaffleScreenViewModel({Key key, contestants}) : assert(contestants != null) {
    _contestants = contestants;
    state = RaffleUserList(contestants: contestants);
  }

  void raffle() {
    state = RaffleExecutingRaffle(contestants: _contestants);
    notifyListeners();
    _execute();
  }

  void _execute() {
    _contestants.shuffle();
    // Twice to ensure randomness, lol, kidding :)
    _contestants.shuffle();
    state = RaffleWinner(winner: _contestants.first);
    notifyListeners();
  }
}
