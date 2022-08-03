import 'package:dococr/pages/add_customer.dart';
import 'package:dococr/pages/doc.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/ic.dart';
import 'package:dococr/pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/ic': (context) => IC(),
        '/doc': (context) => DocumentUpload(),
        '/add-edit-customer': (context) => new AddEditCustomer()
      },
    ));
