import 'dart:ffi';
import 'package:dococr/services/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:dococr/services/data.dart';

class Customer {
  final int id;
  final DateTime created_at;
  final String customer_name;
  final int ic;
  final int age;
  final String gender;
  final String email;
  final int phone_number;

  Customer(
    this.id,
    this.created_at,
    this.customer_name,
    this.ic,
    this.age,
    this.gender,
    this.email,
    this.phone_number,
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future fetchAllCustomers() async {
    var response = await http.get(Uri.parse('http://localhost:5000/customer'));
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    List<Customer> customers = [];

    for (var c in jsonData) {
      Customer customer = Customer(c['id'], c['created_at'], c['customer_name'],
          c['ic'], c['age'], c['gender'], c['email'], c['phone_number']);
      customers.add(customer);
    }
    print(customers.length);
    return customers;
  }

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
        body: Container(
          child: Card(
            child: FutureBuilder(
                future: fetchAllCustomers(),
                builder: (context, AsyncSnapshot snapshot) {
                  // if (snapshot.data == null) {
                  //   return Container(
                  //     child: Center(
                  //       child: Text("Loading!"),
                  //     ),
                  //   );
                  // } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                        customers: snapshot.data[index])));
                          },
                          tileColor: Color.fromARGB(255, 255, 255, 220),
                          selectedTileColor: Color.fromARGB(255, 252, 252, 73),
                          hoverColor: Color.fromARGB(255, 252, 252, 73),
                          title: Text(
                            snapshot.data['customer_name'],
                            style: GoogleFonts.getFont('Roboto',
                                color: Color.fromARGB(255, 0, 57, 212),
                                fontSize: 25),
                          ),
                          subtitle: Text(
                            snapshot.data['age'].toString() +
                                "                Created at " +
                                snapshot.data['created_at'],
                            style: GoogleFonts.getFont('Roboto',
                                color: Color.fromARGB(255, 20, 82, 117),
                                fontSize: 15),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data['gender'],
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
                                        snapshot.data['id'].toString() +
                                        ".jpg")),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
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
