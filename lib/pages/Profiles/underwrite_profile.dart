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
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'UNDERWRITING FORM DETAILS ID: ' + widget.underwrite.id.toString(),
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
              Text('Policy Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 200),
              Text(
                widget.underwrite.policy_no,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Product Name',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 200),
              Text(
                widget.underwrite.product_name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Product Code',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(widget.underwrite.product_code.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(height: 10),
              Text('Staff Application',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.staff_application,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Remarks',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.remarks,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Bank In Slip Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.bank_in_slipno,
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
              Text('Insurance Plan Name',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.plan_name,
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
              Text('Insurance Plan Term',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.plan_term,
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
              Text('Insurance Plan Sum Assured',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.plan_sum_assured,
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
              Text('Insurance Plan Installment Premium',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.plan_installment_premium,
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
              Text('Premium Payment Frequency',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.premium_payment_freq,
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
              Text('Initial Premium Payment Method',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.initial_payment_method,
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
              Text('Premium Recurring Payment Method',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.recurring_payment_method,
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
              Text('Bank Card Type',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.bank_card_type,
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
              Text('Bank Card Number',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.bank_card_no,
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
              Text('Bank Card Expiry Date',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.bank_card_expiry,
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
              Text('Bank Card Issuer',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                widget.underwrite.bank_card_issuer,
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
