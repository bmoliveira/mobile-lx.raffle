import 'package:flutter/material.dart';
import 'package:raffle/ViewModelState.dart';
import 'package:raffle/screen/Splash/SplashScreen.dart';
import 'package:raffle/screen/Splash/SplashViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(RaffleApp());
}

class RaffleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashScreenViewModel viewModel = SplashScreenViewModel();
    return ScopedModel<ViewModelState<SplashScreenState>>(
        model: viewModel.state,
        child: MaterialApp(
            title: "Raffle",
            theme: ThemeData(primarySwatch: Colors.blue),
            home: SplashScreen(viewModel)));
  }
}
