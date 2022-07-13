// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dococr/pages/doc.dart';
import 'package:dococr/pages/ic.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Customer ID',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://avatars.dicebear.com/api/miniavs/:seed.jpg"),
                        radius: 70.0),
                    SizedBox(width: 50),
                    CircleAvatar(
                      // ignore: sort_child_properties_last
                      child: Text(
                        'M',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.amber,
                    )
                  ],
                ),
                Divider(
                  height: 60.0,
                  color: Colors.lightBlue,
                  thickness: 1.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('NAME',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 200),
                    Text('23 years old',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))
                  ],
                ),
                Text(
                  "Customer Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('IC',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "IC Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Date Created',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "Date Created",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => IC()));
                      },
                      child: Text(
                        'Upload IC',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(400.0),
                          shape: StadiumBorder(),
                          side: BorderSide(width: 2.0))),
                ),
                Center(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocumentUpload()));
                      },
                      child: Text(
                        'Upload Documents',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size.fromWidth(400.0),
                          shape: StadiumBorder(),
                          side: BorderSide(width: 2.0))),
                ),
              ],
            )));
  }
}
