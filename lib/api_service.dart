import 'dart:convert';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:http/http.dart' as http;
import 'package:dococr/model/customer_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<CustomerModel>?> getCustomers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.customerURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return customersFromJson(data["data"]);
    } else {
      return null;
    }
  }
}
