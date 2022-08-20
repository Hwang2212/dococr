// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dococr/pages/addedit/add_customer.dart';
import 'package:dococr/pages/Lists/health_list.dart';
import 'package:dococr/pages/Lists/customer_list.dart';
import 'package:dococr/pages/Lists/underwrite_list.dart';
import 'package:dococr/pages/viewpdf.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.customers});

  final customers;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OutlinedButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  widget.customers.customer_name + ' PROFILE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars.dicebear.com/api/miniavs/:" +
                              widget.customers.id.toString() +
                              '.jpg'),
                      radius: 70.0),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          child: Icon(Icons.edit),
                          backgroundColor: Colors.blue[200],
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/add-edit-customer', arguments: {
                            'model': widget.customers,
                          });
                        },
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      InkWell(
                        child: CircleAvatar(
                          child: Icon(Icons.picture_as_pdf),
                          backgroundColor: Colors.blue[200],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerPDFViewer(
                                      customer: widget.customers)));
                        },
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      CircleAvatar(
                        // ignore: sort_child_properties_last
                        child: Text(
                          widget.customers.gender,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.amber,
                      ),
                    ],
                  )
                ],
              ),
              Center(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HealthList(health: widget.customers)));
                    },
                    child: Text(
                      'View Health Details',
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
                              builder: (context) => UnderwriteList(
                                  underwrite: widget.customers)));
                    },
                    child: Text(
                      'View Underwriting Form Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size.fromWidth(400.0),
                        shape: StadiumBorder(),
                        side: BorderSide(width: 2.0))),
              ),
              Text('NAME',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 200),
              Text(
                widget.customers.customer_name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Age',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(widget.customers.age.toString() + ' Y/O',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(height: 10),
              Text('IC',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.ic.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
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
                widget.customers.created_at,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Phone Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.phone_number,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Email',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Race',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.race,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Nationality',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.nationality,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Corresponding Address',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.corr_address,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('House Phone Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.home_phone,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Office Phone Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.office_phone,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Monthly Income',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "RM  " + widget.customers.monthly_income.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Job',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.customers.duties +
                    ' at -' +
                    widget.customers.business_nature +
                    ' industry',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          )),
    ));
  }
}
