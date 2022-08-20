import 'dart:convert';

List<UnderwriteFormModel> underwriteFormFromJson(dynamic str) =>
    List<UnderwriteFormModel>.from(
        (str).map((x) => UnderwriteFormModel.fromJson(x)));

class UnderwriteFormModel {
  late int? id;
  late String? cust_id;
  late String? created_at;
  late String? file_name;
  late String? uw_filepath;
  late String? uw_driveid;

  UnderwriteFormModel({
    this.id,
    this.cust_id,
    this.created_at,
    this.file_name,
    this.uw_filepath,
    this.uw_driveid,
  });

  UnderwriteFormModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    cust_id = json['cust_id'];
    created_at = json['created_at'];
    file_name = json['file_name'];
    uw_filepath = json['uw_filepath'];
    uw_driveid = json['uw_driveid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['id'] = id;
    _data['cust_id'] = cust_id;
    _data['created_at'] = created_at;
    _data['file_name'] = file_name;
    _data['uw_filepath'] = uw_filepath;
    _data['uw_driveid'] = uw_driveid;

    return _data;
  }
}
