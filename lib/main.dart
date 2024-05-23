import 'package:cookbook/app/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:cookbook/app/features/spash_screen/auth_flow.dart';
import 'package:cookbook/app/features/spash_screen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/features/home/home_screen.dart';
import 'app/features/internet_bloc/bloc/internet_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          fontFamily: 'Satoshi',
          textTheme: const TextTheme(),
          useMaterial3: false,
        ),
        home: const IntroScreen(),
        // home: const AuthenticationFlowScreen(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return const HomeScreen();
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
