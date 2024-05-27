import 'package:cookbook/app/features/internet_bloc/bloc/internet_bloc.dart';
import 'package:cookbook/app/features/authentication/auth_flow_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInternetConnectionScreen extends StatelessWidget {
  const CheckInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const AuthenticationFlowScreen();
          } else if (state is InternetLostState) {
            return const NoInteretScreen();
          } else {
            return const NoInteretScreen();
          }
        },
      ),
    );
  }
}

class NoInteretScreen extends StatelessWidget {
  const NoInteretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'NO INTERNET CONNECTION',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
