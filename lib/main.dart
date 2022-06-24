import 'package:flutter/material.dart';
import 'package:dococr/pages/home.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:dococr/pages/splash.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => AnimatedSplash(
            child: Splash(),
            navigator: Home(),
            type: Transition.fade,
            durationInSeconds: 5),
        '/home': (context) => Home(),
      },
    ));
