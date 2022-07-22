import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchAllCustomers() async {
  var response = await http.get(Uri.parse('http://localhost:5000/customer'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);
}

print(jsonData) {
  // TODO: implement print
  throw UnimplementedError();
}
