import 'package:dococr/pages/add_customer.dart';
import 'package:dococr/pages/add_edit_health.dart';
import 'package:dococr/pages/mainpage.dart';
import 'package:dococr/widget/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/customer_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => MainPage(),
        '/add-edit-customer': (context) => new AddEditCustomer(),
        '/add-edit-health': (context) => new AddEditHealth(
              customer: context,
            ),
        '/customerlist': (context) => new CustomerList(),
        // ignore: unnecessary_new
      },
    ));
