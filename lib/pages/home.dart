import 'dart:ffi' as size;
import 'package:dococr/api_service.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/pages/add_customer.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:dococr/services/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.model}) : super(key: key);

  final CustomerModel? model;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: loadCustomers());
  }

  Widget customerList(customers) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color.fromARGB(255, 252, 252, 73),
                    minimumSize: const Size(88.0, 36.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AddCustomer(),
                    ),
                  );
                },
                child: const Text("Add Customer")),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: customers!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Profile(customers: customers[index])));
                    },
                    tileColor: Color.fromARGB(255, 255, 255, 220),
                    selectedTileColor: Color.fromARGB(255, 252, 252, 73),
                    hoverColor: Color.fromARGB(255, 252, 252, 73),
                    title: Text(
                      customers[index].customer_name,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 57, 212), fontSize: 25),
                    ),
                    subtitle: Text(
                      customers[index].age.toString() +
                          "                Created at " +
                          customers[index].created_at,
                      style: TextStyle(
                          color: Color.fromARGB(255, 20, 82, 117),
                          fontSize: 15),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        customers[index].gender,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              "https://avatars.dicebear.com/api/miniavs/:" +
                                  customers[index].id.toString() +
                                  ".jpg")),
                    ),
                  ),
                );
              },
            )
          ],
        )
      ],
    ));
  }

  Widget loadCustomers() {
    return FutureBuilder(
      future: APIService.getCustomers(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<CustomerModel>?> model,
      ) {
        if (model.hasData) {
          return customerList(model.data);
        }

        return const CircleAvatar(
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
