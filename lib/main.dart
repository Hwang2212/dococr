import 'package:dococr/pages/AddEditItems/add_customer.dart';
import 'package:dococr/pages/AddEditItems/add_edit_health.dart';
import 'package:dococr/pages/AddEditItems/add_underwritingform.dart';
import 'package:dococr/pages/mainpage.dart';
import 'package:dococr/widget/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/Lists/customer_list.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => MainPage(),
        '/add-edit-customer': (context) => new AddEditCustomer(),
        '/add-edit-underwrite': (context) => new AddEditUnderwriteForm(),
        '/add-edit-health': (context) => new AddEditHealth(
              customer: context,
            ),
        '/customerlist': (context) => new CustomerList(),
        // ignore: unnecessary_new
      },
    ));
