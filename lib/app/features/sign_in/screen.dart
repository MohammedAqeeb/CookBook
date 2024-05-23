import 'package:cookbook/app/features/home/home_screen.dart';
import 'package:cookbook/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication_bloc.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'login_screen';

  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.offWhite,
        title: const Text(
          'Login to Your Account',
          style: TextStyle(
            color: AppColors.strawberryRed,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Create Your Account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Email address'),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'enter email id';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text('Password'),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
                obscureText: false,
                validator: (String? value) {
                  if (value == null || value.length < 6) {
                    return 'Password must have at least six characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 30),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationSuccessState) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.id,
                      (route) => false,
                    );
                  } else if (state is AuthenticationFailureState) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(state.errorMessage),
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: AppColors.primaryText,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            SignUpUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        state is AuthenticationLoadingState
                            ? '.......'
                            : 'Signup',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
