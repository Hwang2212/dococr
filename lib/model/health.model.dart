import 'dart:convert';

List<HealthModel> healthFromJson(dynamic str) =>
    List<HealthModel>.from((str).map((x) => HealthModel.fromJson(x)));

class HealthModel {
  late int? id;
  late String? created_at;
  late String? weight;
  late String? height;
  late String? current_ill;
  late String? five_years_ill;
  late String? hazardact;
  late String? rejectinsurance;
  late String? alcoholic;
  late String? hiv;
  late String? ancestral_ill;
  late String? ancestral_desc;
  late String? cust_id;
  late String? smoker;

  HealthModel({
    this.id,
    this.created_at,
    this.weight,
    this.height,
    this.current_ill,
    this.five_years_ill,
    this.hazardact,
    this.rejectinsurance,
    this.alcoholic,
    this.hiv,
    this.ancestral_ill,
    this.ancestral_desc,
    this.cust_id,
    this.smoker,
  });

  HealthModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    created_at = json['created_at'];
    weight = json['weight'].toString();
    height = json['height'].toString();
    current_ill = json['current_ill'];
    five_years_ill = json['five_years_ill'];
    hazardact = json['hazardact'];
    rejectinsurance = json['rejectinsurance'];
    alcoholic = json['alcoholic'];
    hiv = json['hiv'];
    ancestral_ill = json['ancestral_ill'];
    ancestral_desc = json['ancestral_desc'];
    cust_id = json['cust_id'];
    smoker = json['smoker'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['id'] = id;
    _data['created_at'] = created_at;
    _data['weight'] = weight;
    _data['height'] = height;
    _data['current_ill'] = current_ill;
    _data['five_years_ill'] = five_years_ill;
    _data['hazardact'] = hazardact;
    _data['rejectinsurance'] = rejectinsurance;
    _data['alcoholic'] = alcoholic;
    _data['hiv'] = hiv;
    _data['ancestral_ill'] = ancestral_ill;
    _data['ancestral_desc'] = ancestral_desc;
    _data['cust_id'] = cust_id;
    _data['smoker'] = smoker;

    return _data;
  }
}
