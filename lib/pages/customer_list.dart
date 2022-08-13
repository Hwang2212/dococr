import 'package:dococr/api_service.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/pages/add_customer.dart';
import 'package:dococr/widget/customer_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:dococr/pages/profile.dart';
// import 'package:dococr/services/data.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key, this.model}) : super(key: key);

  final CustomerModel? model;

  @override
  State<CustomerList> createState() => _CustomerListState();
}

enum _MenuValues { add_edit_underwritingform, add_edit_customers }

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: customerList());
  }

  Widget customerList() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'CUSTOMER LIST',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
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
                          const AddEditCustomer(),
                    ),
                  );
                },
                child: const Text("Add Customer")),
            ConstrainedBox(
              child: CustomerListWidget(),
              constraints: BoxConstraints(maxHeight: 570),
            )
          ],
        )
      ],
    ));
  }
}
