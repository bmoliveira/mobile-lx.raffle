import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/model/Contestant.dart';
import 'package:raffle/screen/Splash/SplashViewModel.dart';
import 'package:raffle/screen/raffle_list/RaffleScreen.dart';
import 'package:raffle/screen/raffle_list/RaffleScreenViewModel.dart';
import 'package:raffle/view/TitleText.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenViewModel _viewModel;

  SplashScreen(this._viewModel) : super();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModelState<SplashScreenState>>(
      builder: (context, child, state) {
        SplashScreenState value = state.value;
        if (value is Loading) {
          _loadData(context);
        }
        return _loadingState();
      },
    );
  }

  void _loadData(BuildContext context) async {
    final contestants = await _viewModel.loadUsers();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: _contestantListBuilder(contestants)),
    );
  }

  Widget _contestantList(List<Contestant> contestants) {
    RaffleScreenViewModel viewModel = RaffleScreenViewModel(contestants: contestants);
    return ScopedModel<ViewModelState<RaffleScreenViewState>>(
      model: viewModel.state,
      child: RaffleScreen(viewModel),
    );
  }

  WidgetBuilder _contestantListBuilder(List<Contestant> contestants) {
    return (context) {
      return _contestantList(contestants);
    };
  }

  Widget _loadingState() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/porto_background.jpg"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BoldTitleText("mobile.lx"),
          RegularTitleText("to"),
          BoldTitleText("NDC"),
          BoldTitleText("{ Porto }")
        ],
      ),
    );
  }
}
