import 'package:flutter/foundation.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/constant/Constants.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreenViewModel {
  ViewModelState<SplashScreenState> state = ViewModelState(Loading());

  Future<List<Contestant>> loadUsers() async {
    return Constants.fetchContestants();
  }
}

abstract class SplashScreenState extends Model {}

class Loading extends SplashScreenState {}

class ContestantList extends SplashScreenState {
  List<Contestant> contestants;

  ContestantList({Key key, this.contestants})
      : assert(contestants != null),
        super();
}
