import 'package:cookbook/app/features/authentication/login/bloc/login_bloc.dart';
import 'package:cookbook/app/features/authentication/sign_up/sign_up_screen.dart';
import 'package:cookbook/app/features/home/home_screen.dart';
import 'package:cookbook/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 42, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.blueberryBlue,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 10),
                Column(
                  children: [
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
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.id,
                            (route) => false,
                          );
                        } else if (state is LoginFailureState) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                ],
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
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginUser(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                            child: state is LoginLoadingState
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Does\'t have an Account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text('SignUp'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
