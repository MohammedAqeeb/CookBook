import 'package:cookbook/app/features/authentication/login/login_screen.dart';

import 'package:cookbook/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bloc/sign_up_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
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
          padding: const EdgeInsets.only(
            top: 42,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Create Your Account',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.blueberryBlue,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Enter Your Name'),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name',
                ),
                validator: (String? value) {
                  if (value == null || value.length < 3) {
                    return 'Enter valid name';
                  } else {
                    return null;
                  }
                },
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
              BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccessState) {
                    Fluttertoast.showToast(
                      msg: 'User Created Successfully.',
                      backgroundColor: AppColors.kiwiGreen,
                      fontSize: 12,
                      textColor: AppColors.primaryFourElementText,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen(),
                      ),
                    );

                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   HomeScreen.id,
                    //   (route) => false,
                    // );
                  } else if (state is SignUpFailureState) {
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
                          BlocProvider.of<SignUpBloc>(context).add(
                            SignUpUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        state is SignUpLoadingState ? '.......' : 'Signup',
                        style: const TextStyle(
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
                  const Text('Already have an Account ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
