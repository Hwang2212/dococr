import 'package:dococr/api_service.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/pages/add_customer.dart';
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
    return Scaffold(body: loadCustomers());
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
                    tileColor: Color.fromARGB(255, 176, 250, 255),
                    selectedTileColor: Color.fromARGB(255, 252, 252, 73),
                    hoverColor: Color.fromARGB(255, 252, 252, 73),
                    title: Text(
                      customers[index].customer_name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: PopupMenuButton<_MenuValues>(
                      itemBuilder: ((context) => [
                            PopupMenuItem(
                              child: Text('Add/Edit Underwriting Form'),
                              value: _MenuValues.add_edit_underwritingform,
                            ),
                            PopupMenuItem(
                              child: Text('Edit Customer Info'),
                              value: _MenuValues.add_edit_customers,
                            ),
                          ]),
                      onSelected: (value) {
                        switch (value) {
                          case _MenuValues.add_edit_underwritingform:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Profile(customers: customers[index])));
                            break;
                          case _MenuValues.add_edit_customers:
                            Navigator.of(context)
                                .pushNamed('/add-edit-customer', arguments: {
                              'model': customers[index],
                            });
                            break;
                        }
                      },
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
