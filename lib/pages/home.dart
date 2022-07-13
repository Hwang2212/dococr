import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dococr/pages/profile.dart';

class Customer {
  final Int id;
  final String name;
  final Int ic;
  final String gender;
  final Int age;
  final String date_created;

  const Customer(
      this.id, this.name, this.ic, this.gender, this.age, this.date_created);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List customers = [
    {
      "id": 1,
      "name": "Jack",
      "ic": 991111011010,
      "gender": "M",
      "age": 22,
      "date_created": "2021-01-10"
    },
    {
      "id": 2,
      "name": "Jeep",
      "ic": 891111011010,
      "gender": "M",
      "age": 20,
      "date_created": "2021-01-11"
    },
    {
      "id": 3,
      "name": "Jill",
      "ic": 791111011010,
      "gender": "F",
      "age": 21,
      "date_created": "2021-01-12"
    },
    {
      "id": 4,
      "name": "John",
      "ic": 691111011010,
      "gender": "M",
      "age": 32,
      "date_created": "2021-01-13"
    },
    {
      "id": 5,
      "name": "Jou",
      "ic": 941111011010,
      "gender": "F",
      "age": 42,
      "date_created": "2021-01-14"
    },
    {
      "id": 6,
      "name": "Jim",
      "ic": 951111011010,
      "gender": "M",
      "age": 19,
      "date_created": "2021-01-15"
    },
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                title: Text(
                  customers[index]['name'],
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(customers[index]['age'].toString() +
                    "                Created at " +
                    customers[index]['date_created']),
                trailing: Text(customers[index]['gender']),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://avatars.dicebear.com/api/miniavs/:" +
                            customers[index]['id'].toString() +
                            ".jpg")),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.person_add),
        ));
  }
}
