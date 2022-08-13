import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/model/health.model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class APIService {
  static var client = http.Client();

  static Future<List<CustomerModel>?> getCustomers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.customerURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return customersFromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> saveCustomers(
    CustomerModel model,
    bool isEditMode,
    bool isImageSelected,
  ) async {
    var customerURL = Config.customerURL;

    if (isEditMode) {
      customerURL = customerURL + "/" + model.id!.toString();
    }

    var url = Uri.http(Config.apiURL, customerURL);

    var requestMethod = isEditMode ? "PATCH" : "POST";

    // This is content-type is "multipart/form data"
    var request = http.MultipartRequest(requestMethod, url);
    request.headers['Content-Type'] = 'multipart/form-data';
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

    if (model.customer_ic_path != null && isImageSelected) {
      request.files.add(await http.MultipartFile.fromPath(
          "customer_ic_path", model.customer_ic_path!,
          contentType: MediaType('multipart', 'form-data')));
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

// HEALTH QUESTIONNAIRES
  static Future<List<HealthModel>?> getHealth() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.healthURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return healthFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<HealthModel>?> getHealthByCustomerID(
      String? cust_id) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var healthURL = Config.healthURL;
    healthURL = healthURL + "/customer/" + cust_id!;
    var url = Uri.http(Config.apiURL, healthURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data[1].toString());

      return healthFromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> saveHealth(
      HealthModel model, bool isEditMode, int cust_id) async {
    print(model.toJson());
    var healthURL = Config.healthURL;
    // if (isEditMode) {
    //   healthURL = healthURL + "/" + model.id!.toString();
    // }

    healthURL = healthURL + "/customer/" + cust_id.toString();
    var url = Uri.http(Config.apiURL, healthURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    // This is content-type is "multipart/form data"
    var request = http.MultipartRequest(requestMethod, url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields["uw_id"] = model.uw_id!.toString();
    request.fields["height"] = model.height!;
    request.fields["weight"] = model.weight!;
    request.fields["current_ill"] = model.current_ill!;
    request.fields["five_years_ill"] = model.five_years_ill!;
    request.fields["hazardact"] = model.hazardact!;
    request.fields["rejectinsurance"] = model.rejectinsurance!;
    request.fields["hiv"] = model.hiv!;
    request.fields["alcoholic"] = model.alcoholic!;
    request.fields["ancestral_ill"] = model.ancestral_ill!;
    request.fields["ancestral_desc"] = model.ancestral_desc!;

    // if (model.customer_ic_path != null && isImageSelected) {
    //   request.files.add(await http.MultipartFile.fromPath(
    //       "customer_ic_path", model.customer_ic_path!,
    //       contentType: MediaType('multipart', 'form-data')));
    // }

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
