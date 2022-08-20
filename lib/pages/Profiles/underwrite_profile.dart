import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnderwriteProfile extends StatefulWidget {
  const UnderwriteProfile({super.key, required this.underwrite});

  final underwrite;

  @override
  State<UnderwriteProfile> createState() => _UnderwriteProfileState();
}

class _UnderwriteProfileState extends State<UnderwriteProfile> {
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
                child: Text("Back", style: TextStyle(color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'CUSTOMER HEALTH PROFILE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 28.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'Added on ' + widget.underwrite.created_at,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.0),
                ),
              ),
              SizedBox(height: 10),
              Text('Underwriting Form ID',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 200),
              Text(
                widget.underwrite.uw_id.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Customer ID',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 200),
              Text(
                widget.underwrite.cust_id,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('HEIGHT AND WEIGHT (cm/kg)',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                  widget.underwrite.height.toString() +
                      ' CM         ' +
                      widget.underwrite.weight.toString() +
                      ' KG',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(height: 10),
              Text('RECENT ILLNESS (Write Description if YES)',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.current_ill,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('PAST 5 YEARS ILLNESS (Write Description if YES)',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.five_years_ill,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('RECENT HAZARDOUS ACTIVITY (Eg. Yes, Flying)',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.hazardact,
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
              Text('Insurance Application Rejected Before',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.rejectinsurance,
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
              Text('SMOKER',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.smoker,
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
              Text('ALCOHOLIC',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.alcoholic,
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
              Text('Infected with HIV',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.hiv,
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
              Text('ANCESTRAL ILLNESS',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.ancestral_ill,
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
              Text('ANCESTRAL ILLNESS DESCRIPTION',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.ancestral_desc,
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
