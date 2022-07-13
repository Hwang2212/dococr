import 'package:dococr/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/ic.dart';
import 'package:dococr/pages/home.dart';
import 'package:dococr/pages/splash.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/customer',
      routes: {
        '/home': (context) => Home(),
        '/ic': (context) => IC(),
        '/customer': (context) => Profile(),
      },
    ));
