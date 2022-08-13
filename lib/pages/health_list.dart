// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dococr/api_service.dart';
import 'package:dococr/model/health.model.dart';
import 'package:dococr/pages/add_customer.dart';
import 'package:dococr/pages/add_edit_health.dart';
import 'package:dococr/pages/customer_list.dart';
import 'package:dococr/pages/health_profile.dart';
import 'package:flutter/material.dart';

class HealthList extends StatefulWidget {
  const HealthList({super.key, required this.health});

  final health;

  @override
  State<HealthList> createState() => _HealthListState();
}

class _HealthListState extends State<HealthList> {
  @override
  Widget build(BuildContext context) {
    print(widget.health.id);
    // Need to get latest health and pass into this page
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Health History of ' + widget.health.customer_name,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.black,
              primary: Color.fromARGB(255, 176, 250, 255),
              minimumSize: const Size(88.0, 36.0),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AddEditHealth(customer: widget.health),
              ),
            );
          },
          child: const Text("Add Health")),
            loadhealth(),
          ],
        ));
  }

  Widget loadhealth() {
    return FutureBuilder(
      future: APIService.getHealthByCustomerID(widget.health.id.toString()),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<HealthModel>?> model,
      ) {
        if (model.hasData) {
          return healthList(model.data);
        } else {
          return Text("No Health History");
        }
      },
    );
  }
}

Widget healthList(health) {
  return SingleChildScrollView(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      
      ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: health!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HealthProfile(health: health[index])));
              },
              tileColor: Color.fromARGB(255, 255, 255, 220),
              selectedTileColor: Color.fromARGB(255, 252, 252, 73),
              hoverColor: Color.fromARGB(255, 252, 252, 73),
              title: Text(
                "Added on",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 54, 54), fontSize: 12),
              ),
              subtitle: Text(
                health[index].created_at,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      )
    ],
  ));
}
