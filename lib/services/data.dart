import 'dart:convert';
import 'package:http/http.dart' as http;

class Customer {
  late int? id;
  late DateTime? created_at;
  late String? customer_name;
  late int? ic;
  late int? age;
  late String? gender;
  late String? email;
  late int? phone_number;

  Customer({
    this.id,
    this.created_at,
    this.customer_name,
    this.ic,
    this.age,
    this.gender,
    this.email,
    this.phone_number,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created_at = json['created_at'];
    customer_name = json['customer_name'];
    ic = json['ic'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone_number = json['phone_number'];
  }
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();

  return data;
}
