import 'dart:convert';

List<CustomerModel> customersFromJson(dynamic str) =>
    List<CustomerModel>.from((str).map((x) => CustomerModel.fromJson(x)));

class CustomerModel {
  late int? id;
  late DateTime? created_at;
  late String? customer_name;
  late int? ic;
  late int? age;
  late String? gender;
  late String? email;
  late int? phone_number;

  CustomerModel({
    this.id,
    this.created_at,
    this.customer_name,
    this.ic,
    this.age,
    this.gender,
    this.email,
    this.phone_number,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created_at = json['created_at'];
    customer_name = json['customer_name'];
    ic = json['ic'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone_number = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['id'] = id;
    _data['created_at'] = created_at;
    _data['customer_name'] = customer_name;
    _data['ic'] = ic;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['phone_number'] = phone_number;

    return _data;
  }
}
