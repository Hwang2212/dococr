import 'dart:convert';

List<CustomerModel> customersFromJson(dynamic str) =>
    List<CustomerModel>.from((str).map((x) => CustomerModel.fromJson(x)));

class CustomerModel {
  late int? id;
  late String? created_at;
  late String? customer_name;
  late String? ic;
  late String? age;
  late String? gender;
  late String? email;
  late String? phone_number;
  late String? marital_status;
  late String? race;
  late String? nationality;
  late String? corr_address;
  late String? home_phone;
  late String? office_phone;
  late int? monthly_income;
  late String? duties;
  late String? business_nature;

  CustomerModel({
    this.id,
    this.created_at,
    this.customer_name,
    this.ic,
    this.age,
    this.gender,
    this.email,
    this.phone_number,
    this.marital_status,
    this.race,
    this.nationality,
    this.corr_address,
    this.home_phone,
    this.office_phone,
    this.monthly_income,
    this.duties,
    this.business_nature,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    created_at = json['created_at'];
    customer_name = json['customer_name'];
    ic = json['ic'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone_number = json['phone_number'];
    marital_status = json['marital_status'];
    race = json['race'];
    nationality = json['nationality'];
    corr_address = json['corr_address'];
    home_phone = json['home_phone'];
    office_phone = json['office_phone'];
    monthly_income = json['monthly_income'];
    duties = json['duties'];
    business_nature = json['business_nature'];
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
    _data['marital_status'] = marital_status;
    _data['race'] = race;
    _data['nationality'] = nationality;
    _data['corr_address'] = corr_address;
    _data['home_phone'] = home_phone;
    _data['office_phone'] = office_phone;
    _data['monthly_income'] = monthly_income;
    _data['duties'] = duties;
    _data['business_nature'] = business_nature;

    return _data;
  }
}
