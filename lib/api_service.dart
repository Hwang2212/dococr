import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/model/health.model.dart';
import 'package:dococr/model/underwrite_model.dart';
import 'package:dococr/model/underwriteform_model.dart';
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

      return healthFromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> saveHealth(
      HealthModel model, bool isEditMode, int cust_id) async {
    var healthURL = Config.healthURL + "/customer/" + cust_id.toString();

    if (isEditMode) {
      healthURL = healthURL + "/" + model.id!.toString();
    }

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

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // UNDERWRITING FORM
  static Future<bool> saveUWForm(
    CustomerModel customermodel,
    HealthModel healthmodel,
    UnderwriteModel underwriteModel,
    bool isEditMode,
  ) async {
    var underwriteURL = Config.underwriteURL;

    if (isEditMode) {
      underwriteURL = underwriteURL +
          "/" +
          customermodel.id!.toString() +
          "/" +
          healthmodel.id!.toString() +
          "/" +
          underwriteModel.id!.toString();
    }
    var url = Uri.http(Config.apiURL, underwriteURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    // This is content-type is "multipart/form data"
    var request = http.MultipartRequest(requestMethod, url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields["customer_name"] = customermodel.customer_name!;
    request.fields["ic"] = customermodel.ic!;
    request.fields["age"] = customermodel.age!;
    request.fields["gender"] = customermodel.gender!;
    request.fields["email"] = customermodel.email!;
    request.fields["phone_number"] = customermodel.phone_number!;
    request.fields["marital_status"] = customermodel.marital_status!;
    request.fields["race"] = customermodel.race!;
    request.fields["nationality"] = customermodel.nationality!;
    request.fields["corr_address"] = customermodel.corr_address!;
    request.fields["home_phone"] = customermodel.home_phone!;
    request.fields["office_phone"] = customermodel.office_phone!;
    request.fields["monthly_income"] = customermodel.monthly_income!.toString();
    request.fields["duties"] = customermodel.duties!;
    request.fields["business_nature"] = customermodel.business_nature!;

    request.fields["policy_no"] = underwriteModel.policy_no!;
    request.fields["product_name"] = underwriteModel.product_name!;
    request.fields["product_code"] = underwriteModel.product_code!;
    request.fields["staff_application"] = underwriteModel.staff_application!;
    request.fields["remarks"] = underwriteModel.remarks!;
    request.fields["bank_in_slipno"] = underwriteModel.bank_in_slipno!;
    request.fields["plan_name"] = underwriteModel.plan_name!;
    request.fields["plan_term"] = underwriteModel.plan_term!;
    request.fields["plan_sum_assured"] = underwriteModel.plan_sum_assured!;
    request.fields["plan_installment_premium"] =
        underwriteModel.plan_installment_premium!;
    request.fields["premium_payment_freq"] =
        underwriteModel.premium_payment_freq!;
    request.fields["initial_payment_method"] =
        underwriteModel.initial_payment_method!;
    request.fields["recurring_payment_method"] =
        underwriteModel.recurring_payment_method!;
    request.fields["bank_card_type"] = underwriteModel.bank_card_type!;
    request.fields["bank_card_expiry"] = underwriteModel.bank_card_expiry!;
    request.fields["bank_card_issuer"] = underwriteModel.bank_card_issuer!;
    request.fields["bank_card_no"] = underwriteModel.bank_card_no!;

    request.fields["height"] = healthmodel.height!;
    request.fields["weight"] = healthmodel.weight!;
    request.fields["current_ill"] = healthmodel.current_ill!;
    request.fields["five_years_ill"] = healthmodel.five_years_ill!;
    request.fields["hazardact"] = healthmodel.hazardact!;
    request.fields["rejectinsurance"] = healthmodel.rejectinsurance!;
    request.fields["hiv"] = healthmodel.hiv!;
    request.fields["alcoholic"] = healthmodel.alcoholic!;
    request.fields["ancestral_ill"] = healthmodel.ancestral_ill!;
    request.fields["ancestral_desc"] = healthmodel.ancestral_desc!;

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List?> uploadUWForm(
    UnderwriteFormModel model,
  ) async {
    var uploadUWURL = Config.underwriteURL + Config.uploadURL;

    var url = Uri.http(Config.apiURL, uploadUWURL);

    var requestMethod = "POST";

    // This is content-type is "multipart/form data"
    var request = http.MultipartRequest(requestMethod, url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields["file_name"] = model.file_name!;

    if (model.uw_filepath != null) {
      request.files.add(await http.MultipartFile.fromPath(
          "uw_filepath", model.uw_filepath!,
          contentType: MediaType('multipart', 'form-data')));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      var customerData = CustomerModel.fromJson(data["customer"]);
      var underwriteData = UnderwriteModel.fromJson(data["underwrite"]);
      var healthData = HealthModel.fromJson(data["health"]);
      List dataList = [customerData, underwriteData, healthData];
      return dataList;
    } else {
      return null;
    }
  }

  static Future<List<UnderwriteFormModel>?> getPDFByCustomerID(
      String? cust_id) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var pdfURL = Config.pdfURL;
    pdfURL = pdfURL + "/customer/" + cust_id!;
    var url = Uri.http(Config.apiURL, pdfURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return underwriteFormFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<UnderwriteModel>?> getUnderwriteByCustomerID(
      String? id) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var underwriteURL = Config.underwriteURL;
    underwriteURL = underwriteURL + "/customer/" + id!;
    var url = Uri.http(Config.apiURL, underwriteURL);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return underwriteFromJson(data);
    } else {
      return null;
    }
  }
}
