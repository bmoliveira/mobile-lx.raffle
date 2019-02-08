import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:raffle/screen/RaffleWinnerScreen.dart';
import 'package:raffle/screen/raffle_list/RaffleListItem.dart';
import 'package:raffle/screen/raffle_list/RaffleScreenViewModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:indexed_list_view/indexed_list_view.dart';


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
    ScrollController controller = ScrollController();
    return ListView.builder(
      controller: controller,
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
            _raffle(context, (index) {
              controller.jumpTo(95.toDouble() * index);
            });
          });
        }
      },
    );
  }

  void _raffle(BuildContext context, void Function(int) jumpToIndex) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(child: SpinKitRotatingCircle(color: Colors.blue, size: 80,), padding: EdgeInsets.only(bottom: 20),),
                      Text("Sorting things out...", textAlign: TextAlign.center,),
                    ],),
                )
              ],
            )
        )
    );

    final winnerIndex = await _viewModel.raffle();
    final winner = _viewModel.contestants[winnerIndex];

    await new Future.delayed(new Duration(seconds: 2), () {});

    jumpToIndex(winnerIndex);

    await new Future.delayed(new Duration(milliseconds: 500), () {});

    Navigator.of(context).pop();

    await new Future.delayed(new Duration(milliseconds: 200), () {});

    _showWinner(context, winner);
  }

  void _showWinner(BuildContext context, Contestant winner) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RaffleWinnerScreen(winner)));
  }

}
