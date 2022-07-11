import 'package:flutter/material.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List customers = [
    {"id": 1, "name": "Jack", "ic": 991111011010, "gender": "M", "age": 22},
    {"id": 2, "name": "Jeep", "ic": 891111011010, "gender": "M", "age": 20},
    {"id": 3, "name": "Jill", "ic": 791111011010, "gender": "F", "age": 21},
    {"id": 4, "name": "John", "ic": 691111011010, "gender": "M", "age": 32},
    {"id": 5, "name": "Jou", "ic": 941111011010, "gender": "F", "age": 42},
    {"id": 6, "name": "Jim", "ic": 951111011010, "gender": "M", "age": 19},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(
                  customers[index]['name'],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Age: " + customers[index]['age'].toString()),
                trailing: Text(customers[index]['gender']),
              ),
            );
          },
        ));
  }
}
