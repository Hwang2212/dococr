import 'package:dococr/pages/add_customer.dart';
import 'package:dococr/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/customer_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/add-edit-customer': (context) => new AddEditCustomer(),
        '/customerlist': (context) => new CustomerList()
        // '/add-edit-health': (context) => new AddEditHealth()
      },
    ));
