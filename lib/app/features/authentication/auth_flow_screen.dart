import 'package:cookbook/app/features/authentication/login/login_screen.dart';
import 'package:cookbook/app/features/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});
  static String id = 'main screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData || snapshot.data != null) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
