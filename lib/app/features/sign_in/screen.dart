// import 'package:cookbook/app/features/sign_up/widgets/sign_up_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignInBloc, SigninState>(
//       builder: (context, state) {
//         return Container(
//           color: Colors.white,
//           child: SafeArea(
//             child: Scaffold(
//               backgroundColor: Colors.white,
//               appBar: buildAppBar('Sign In'),
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                         child: buildReuseableText(
//                             'Or use your email account to login')),
//                     Container(
//                       padding:
//                           EdgeInsets.only(top: 36.h, left: 18.w, right: 18.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           buildReuseableText('Email'),
//                           SizedBox(height: 10.h),
//                           buildTextField(
//                             'Enter Your Email Address',
//                             'email',
//                             Icons.email,
//                             (email) {
//                               context
//                                   .read<SignInBloc>()
//                                   .add(SignInEmailEvent(email: email));
//                             },
//                           ),
//                           SizedBox(height: 14.h),
//                           buildReuseableText('Password'),
//                           SizedBox(height: 10.h),
//                           buildTextField(
//                             'Enter Your Password',
//                             'password',
//                             lockIcon,
//                             (password) {
//                               context
//                                   .read<SignInBloc>()
//                                   .add(SignInPasswordEvent(password: password));
//                             },
//                           ),
//                           buildForgetPasswordButton(),
//                           buildLoginButton('Log In', 'login', () {
//                             SignInController(context: context)
//                                 .handleSignIn('email');
//                           }),
//                           buildLoginButton('Sign Up', 'register', () {
//                             Navigator.of(context).pushNamed('signUp');
//                           }),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
