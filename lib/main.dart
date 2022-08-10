import 'package:dococr/pages/add_customer.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/customer_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/customerlist',
      routes: {
        // '/home': (context) => Home(),
        '/add-edit-customer': (context) => new AddEditCustomer(),
        '/customerlist': (context) => new CustomerList()
        // '/add-edit-customer': (context) => new AddEditCustomer()
      },
    ));
