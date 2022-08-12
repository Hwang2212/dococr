import 'package:dococr/pages/customer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }

  Widget HomeBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'DOC OCR',
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                color: Colors.blueGrey),
          ),
        ),
        Container(
          height: 45,
          width: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
            color: Color.fromARGB(255, 54, 238, 252),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome User',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'ADD UNDERWRITING FORM BY:',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 176, 250, 255),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.file_upload),
                      Center(
                          child: Text(
                        'Upload Form',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
                onTap: (() {})),
            InkWell(
              child: Container(
                height: 120,
                width: 180,
                padding: EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 176, 250, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.file_copy),
                    Center(
                        child: Text(
                      'Fill up Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'CUSTOMER LIST',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        ConstrainedBox(
          child: CustomerList(),
          constraints: BoxConstraints(maxHeight: 280),
        )
      ],
    );
  }
}
