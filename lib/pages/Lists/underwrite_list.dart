// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dococr/api_service.dart';
import 'package:dococr/model/health.model.dart';
import 'package:dococr/model/underwrite_model.dart';
import 'package:dococr/pages/AddEditItems/add_edit_health.dart';
import 'package:dococr/pages/Profiles/health_profile.dart';
import 'package:dococr/pages/Profiles/underwrite_profile.dart';
import 'package:flutter/material.dart';

class UnderwriteList extends StatefulWidget {
  const UnderwriteList({super.key, required this.underwrite});

  final underwrite;

  @override
  State<UnderwriteList> createState() => _UnderwriteListState();
}

class _UnderwriteListState extends State<UnderwriteList> {
  @override
  Widget build(BuildContext context) {
    // Need to get latest health and pass into this page
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Underwrite History of ' + widget.underwrite.customer_name,
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
                      builder: (BuildContext context) =>
                          AddEditHealth(customer: widget.underwrite),
                    ),
                  );
                },
                child: const Text("Add Health")),
            loadunderwrite(),
          ],
        ));
  }

  Widget loadunderwrite() {
    return FutureBuilder(
      future:
          APIService.getUnderwriteByCustomerID(widget.underwrite.id.toString()),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<UnderwriteModel>?> model,
      ) {
        if (model.hasData) {
          return underwriteList(model.data);
        } else {
          return Text("No Underwriting History");
        }
      },
    );
  }
}

enum _UnderwriteValues { add_edit_underwrite }

Widget underwriteList(underwrite) {
  return SingleChildScrollView(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: underwrite!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UnderwriteProfile(underwrite: underwrite[index])));
              },
              tileColor: Color.fromARGB(255, 255, 255, 220),
              selectedTileColor: Color.fromARGB(255, 252, 252, 73),
              hoverColor: Color.fromARGB(255, 252, 252, 73),
              title: Text(
                "Underwriting Form ID",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 54, 54), fontSize: 12),
              ),
              subtitle: Text(
                underwrite[index].id.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: PopupMenuButton<_UnderwriteValues>(
                itemBuilder: ((context) => [
                      PopupMenuItem(
                        child: Text('Edit Underwrite Details'),
                        value: _UnderwriteValues.add_edit_underwrite,
                      ),
                    ]),
                onSelected: (value) {
                  switch (value) {
                    case _UnderwriteValues.add_edit_underwrite:
                      Navigator.of(context).pushNamed('/add-edit-health',
                          arguments: {
                            'model': underwrite[index],
                            'cust_id': underwrite[index].id
                          });
                      break;
                  }
                },
              ),
            ),
          );
        },
      )
    ],
  ));
}
