import 'dart:convert';

List<UnderwriteModel> underwriteFromJson(dynamic str) =>
    List<UnderwriteModel>.from((str).map((x) => UnderwriteModel.fromJson(x)));

class UnderwriteModel {
  late int? id;
  late String? created_at;
  late String? customer_id;
  late String? policy_no;
  late String? product_name;
  late String? product_code;
  late String? staff_application;
  late String? remarks;
  late String? bank_in_slipno;
  late String? plan_name;
  late String? plan_term;
  late String? plan_sum_assured;
  late String? plan_installment_premium;
  late String? premium_payment_freq;
  late String? initial_payment_method;
  late String? recurring_payment_method;
  late String? bank_card_type;
  late String? bank_card_expiry;
  late String? bank_card_issuer;
  late String? bank_card_no;

  UnderwriteModel({
    this.id,
    this.created_at,
    this.customer_id,
    this.policy_no,
    this.product_name,
    this.product_code,
    this.staff_application,
    this.remarks,
    this.bank_in_slipno,
    this.plan_name,
    this.plan_term,
    this.plan_sum_assured,
    this.plan_installment_premium,
    this.premium_payment_freq,
    this.initial_payment_method,
    this.recurring_payment_method,
    this.bank_card_type,
    this.bank_card_expiry,
    this.bank_card_issuer,
    this.bank_card_no,
  });

  UnderwriteModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    created_at = json['created_at'];
    customer_id = json['customer_id'];
    policy_no = json['policy_no'];
    product_name = json['product_name'];
    product_code = json['product_code'];
    staff_application = json['staff_application'];
    remarks = json['remarks'];
    bank_in_slipno = json['bank_in_slipno'];
    plan_name = json['plan_name'];
    plan_term = json['plan_term'];
    plan_sum_assured = json['plan_sum_assured'];
    plan_installment_premium = json['plan_installment_premium'];
    premium_payment_freq = json['premium_payment_freq'];
    initial_payment_method = json['initial_payment_method'];
    recurring_payment_method = json['recurring_payment_method'];
    bank_card_type = json['bank_card_type'];
    bank_card_expiry = json['bank_card_expiry'];
    bank_card_issuer = json['bank_card_issuer'];
    bank_card_no = json['bank_card_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['id'] = id;
    _data['created_at'] = created_at;
    _data['customer_id'] = customer_id;
    _data['product_name'] = product_name;
    _data['policy_no'] = policy_no;
    _data['product_code'] = product_code;
    _data['staff_application'] = staff_application;
    _data['remarks'] = remarks;
    _data['bank_in_slipno'] = bank_in_slipno;
    _data['plan_name'] = plan_name;
    _data['plan_term'] = plan_term;
    _data['plan_sum_assured'] = plan_sum_assured;
    _data['plan_installment_premium'] = plan_installment_premium;
    _data['premium_payment_freq'] = premium_payment_freq;
    _data['initial_payment_method'] = initial_payment_method;
    _data['recurring_payment_method'] = recurring_payment_method;
    _data['bank_card_type'] = bank_card_type;
    _data['bank_card_expiry'] = bank_card_expiry;
    _data['bank_card_issuer'] = bank_card_issuer;
    _data['bank_card_no'] = bank_card_no;

    return _data;
  }
}
