import 'dart:async';

import 'package:cookbook/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/cook.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(
                  _controller,
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 50.0,
          //   left: 16.0,
          //   right: 16.0,
          //   child: Column(
          //     children: [
          //       FilledButton(
          //         style: FilledButton.styleFrom(
          //           minimumSize: const Size.fromHeight(49.0),
          //         ),
          //         onPressed: () {},
          //         child: Text(
          //           'Sign up or Login',
          //           textAlign: TextAlign.center,
          //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //               ),
          //         ),
          //       ),
          //       const SizedBox(height: 16.0),
          //       OutlinedButton(
          //         style: OutlinedButton.styleFrom(
          //           side: const BorderSide(color: Colors.white, width: 1.5),
          //           minimumSize: const Size.fromHeight(48.0),
          //         ),
          //         onPressed: () {},
          //         child: Text(
          //           'Continue as Guest',
          //           textAlign: TextAlign.center,
          //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //               ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
