import 'dart:convert';
import 'dart:developer';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<List<CustomerModel>?> getCustomers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.customerURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log(data[1].toString());

      return customersFromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> saveCustomers(
    CustomerModel model,
    bool isEditMode,
  ) async {
    var customerURL = Config.customerURL;

    if (isEditMode) {
      customerURL = customerURL + "/" + model.id!.toString();
    }

    var url = Uri.http(Config.apiURL, customerURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    // This is content-type is "multipart/form data"
    var request = http.MultipartRequest(requestMethod, url);
    request.fields["customer_name"] = model.customer_name!;
    request.fields["ic"] = model.ic!;
    request.fields["age"] = model.age!;
    request.fields["gender"] = model.gender!;
    request.fields["email"] = model.email!;
    request.fields["phone_number"] = model.phone_number!;
    request.fields["marital_status"] = model.marital_status!;
    request.fields["race"] = model.race!;
    request.fields["nationality"] = model.nationality!;
    request.fields["corr_address"] = model.corr_address!;
    request.fields["home_phone"] = model.home_phone!;
    request.fields["office_phone"] = model.office_phone!;
    request.fields["monthly_income"] = model.monthly_income!.toString();
    request.fields["duties"] = model.duties!;
    request.fields["business_nature"] = model.business_nature!;

    // if (model.customerIC != null) {
    //   http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'customerIC',
    //     model.customerIC!,
    //   );

    // request.files.add(multipartFile);
    // }

    var response = await request.send();
    print(response.statusCode);
    print(customerURL);
    print(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
