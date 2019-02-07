import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:raffle/screen/RaffleWinnerScreen.dart';
import 'package:raffle/screen/raffle_list/RaffleListItem.dart';
import 'package:raffle/screen/raffle_list/RaffleScreenViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class RaffleScreen extends StatelessWidget {
  final RaffleScreenViewModel _viewModel;

  RaffleScreen(this._viewModel): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contestants'),
        ),
      body: SafeArea(
        child: new ScopedModelDescendant<ViewModelState<RaffleScreenViewState>>(
            builder: (context, child, state) {
              final value = state.value;
              if (value is RaffleUserList) {
                return _raffleUserList(value);
              }
            }),
      ),
    );
  }

  Widget _raffleUserList(RaffleUserList state) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: state.items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = state.items[index];

        if (item is RaffleContestantItem) {
          return item.build(context);
        } else if (item is ExecuteRaffleItem) {
          return item.build(context, () {
            _raffle(context);
          });
        }
      },
    );
  }

  void _raffle(BuildContext context) {
    _showWinner(context, _viewModel.raffle());
  }

  void _showWinner(BuildContext context, Contestant winner) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RaffleWinnerScreen(winner)));
  }

}
