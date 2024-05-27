import 'package:cookbook/app/features/authentication/login/bloc/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/authentication/sign_up/bloc/sign_up_bloc.dart';

import 'app/features/internet_bloc/bloc/internet_bloc.dart';
import 'app/features/spash_screen/screen.dart';

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
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Satoshi',
          textTheme: const TextTheme(),
          useMaterial3: false,
        ),
        home: const IntroScreen(),
      ),
    );
  }
}
