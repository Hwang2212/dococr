import 'dart:ffi';
import 'package:dococr/api_service.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Container(
          child: Card(
            child: FutureBuilder(
                future: ,
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

  Widget loadCustomers(){
    return FutureBuilder(
      future: APIService.getCustomers(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<CustomerModel>?> model,
      ) {
         if (model.hasData){
          return 
         }
      },

      );
  }
}
