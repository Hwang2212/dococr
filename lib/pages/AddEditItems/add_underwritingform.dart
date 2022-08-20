import 'dart:developer';
import 'dart:io';

import 'package:dococr/api_service.dart';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/model/health.model.dart';
import 'package:dococr/model/underwrite_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:file_picker/file_picker.dart';

class AddEditUnderwriteForm extends StatefulWidget {
  const AddEditUnderwriteForm({Key? key}) : super(key: key);
  static const routeName = "/add-edit-underwrite";

  @override
  State<AddEditUnderwriteForm> createState() => _AddUnderwriteState();
}

class _AddUnderwriteState extends State<AddEditUnderwriteForm> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  CustomerModel? customerModel;
  UnderwriteModel? underwriteModel;
  HealthModel? healthModel;
  bool isEditMode = false;
  String? selectedImage;
  bool isImageSelected = false;
  bool isImageDrive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Underwriting Form',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: underwriteForm(),
        ),
        inAsyncCall: isAPICallProcess,
        opacity: .3,
        key: UniqueKey(),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    customerModel = CustomerModel();
    underwriteModel = UnderwriteModel();
    healthModel = HealthModel();

    Future.delayed(Duration.zero, (() {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        customerModel = arguments["customermodel"];
        underwriteModel = arguments["underwritemodel"];
        healthModel = arguments["healthmodel"];

        setState(() {
          isEditMode = true;
        });
      }
    }));
  }

  Widget underwriteForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'CUSTOMER DETAILS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 28.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Customer Name',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 8),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerName",
                  "Customer Name",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer Name can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.customer_name = onSavedVal;
                  },
                  initialValue: customerModel!.customer_name ?? "",
                  suffixIcon: const Icon(Icons.perm_identity_outlined),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Customer IC',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "customer_ic_path",
                  "Customer IC",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer IC can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.ic = onSavedVal;
                  },
                  initialValue: customerModel!.ic ?? "",
                  suffixIcon: const Icon(Icons.credit_card_rounded),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Customer Age',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Age",
                  "Age",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Age can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.age = onSavedVal;
                  },
                  initialValue: customerModel!.age ?? "",
                  suffixIcon: const Icon(Icons.calendar_today),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Gender',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerGender",
                  "Gender",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer Gender can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.gender = onSavedVal;
                  },
                  initialValue: customerModel!.gender ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Email',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerEmail",
                  "Email",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer Email can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.email = onSavedVal;
                  },
                  initialValue: customerModel!.email ?? "",
                  suffixIcon: const Icon(Icons.email_outlined),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Phone Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerPhone",
                  "Phone Number",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Phone Number can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.phone_number = onSavedVal;
                  },
                  initialValue: customerModel!.phone_number ?? "",
                  suffixIcon: const Icon(Icons.phone),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Marital Status',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerMarital",
                  "Marital Status",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Marital Status can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.marital_status = onSavedVal;
                  },
                  initialValue: customerModel!.marital_status ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Ethnicity',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerRace",
                  "Race",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Race can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.race = onSavedVal;
                  },
                  initialValue: customerModel!.race ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Nationality',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerNationality",
                  "Nationality",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer Nationality can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.nationality = onSavedVal;
                  },
                  initialValue: customerModel!.nationality ?? "",
                  suffixIcon: const Icon(Icons.emoji_flags_outlined),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Corresponding Address',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CorrespondingAddress",
                  "Corresponding Address",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Corresponding Address can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.corr_address = onSavedVal;
                  },
                  initialValue: customerModel!.corr_address ?? "",
                  suffixIcon: const Icon(Icons.house),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('House Phone Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "HousePhone",
                  "House Phone",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "House Phone can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.home_phone = onSavedVal;
                  },
                  initialValue: customerModel!.home_phone ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Office Phone Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "OfficePhone",
                  "Office Phone Number",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Office Phone Number can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.office_phone = onSavedVal;
                  },
                  initialValue: customerModel!.office_phone ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('What is Customers Monthly Income',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "MonthlyIncome",
                  "Monthly Income",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Monthly Income can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.monthly_income = int.parse(onSavedVal);
                  },
                  initialValue: customerModel!.monthly_income.toString() ?? "",
                  suffixIcon: const Icon(Icons.attach_money_sharp),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Job',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Duties",
                  "Job Duties",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Job Duties can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.duties = onSavedVal;
                  },
                  initialValue: customerModel!.duties ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Industry Working In',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "BusinessNature",
                  "Business Nature",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Business Nature can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    customerModel!.business_nature = onSavedVal;
                  },
                  initialValue: customerModel!.business_nature ?? "",
                  suffixIcon: const Icon(Icons.email_outlined),
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Divider(
                thickness: 3.0,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'UNDERWRITING FORM DETAILS',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 28.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Policy Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Policy Number",
                  "Policy Number",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Policy Number can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.policy_no = onSavedVal;
                  },
                  initialValue: underwriteModel!.policy_no ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Product Name',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Product Name",
                  "Product Name",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Product Name can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.product_name = onSavedVal;
                  },
                  initialValue: underwriteModel!.product_name ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Product Code',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Product Code",
                  "Product Code",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Product Code can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.product_code = onSavedVal;
                  },
                  initialValue: underwriteModel!.product_code ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Staff Application',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Staff Application",
                  "Staff Application",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Staff Application can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.staff_application = onSavedVal;
                  },
                  initialValue: underwriteModel!.staff_application ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Remarks',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Remarks",
                  "Remarks",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Remarks can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.remarks = onSavedVal;
                  },
                  initialValue: underwriteModel!.remarks ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Bank In Slip Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Bank In Slip Number",
                  "Bank In Slip Number",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Bank In Slip Number can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.bank_in_slipno = onSavedVal;
                  },
                  initialValue: underwriteModel!.bank_in_slipno ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Insurance Plan Name',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Insurance Plan Name",
                  "Insurance Plan Name",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Insurance Plan Name can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.plan_name = onSavedVal;
                  },
                  initialValue: underwriteModel!.plan_name ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Insurance Plan Term',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Insurance Plan Term",
                  "Insurance Plan Term",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Insurance Plan Term can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.plan_term = onSavedVal;
                  },
                  initialValue: underwriteModel!.plan_term ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Insurance Plan Sum Assured',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Insurance Plan Sum Assured",
                  "Insurance Plan Sum Assured",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Insurance Plan Sum Assured can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.plan_sum_assured = onSavedVal;
                  },
                  initialValue: underwriteModel!.plan_sum_assured ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Insurance Plan Installment Premium',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Insurance Plan Installment Premium",
                  "Insurance Plan Installment Premium",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Insurance Plan Installment Premium can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.plan_installment_premium = onSavedVal;
                  },
                  initialValue: underwriteModel!.plan_installment_premium ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Premium Payment Frequency',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Premium Payment Frequency",
                  "Premium Payment Frequency",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Premium Payment Frequency can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.premium_payment_freq = onSavedVal;
                  },
                  initialValue: underwriteModel!.premium_payment_freq ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Initial Premium Payment Method',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Initial Premium Payment Method",
                  "Initial Premium Payment Method",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Initial Premium Payment Method can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.initial_payment_method = onSavedVal;
                  },
                  initialValue: underwriteModel!.initial_payment_method ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Premium Recurring Payment Method',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Premium Recurring Payment Method",
                  "Premium Recurring Payment Method",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Premium Recurring Payment Method can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.recurring_payment_method = onSavedVal;
                  },
                  initialValue: underwriteModel!.recurring_payment_method ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Bank Card Type',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Bank Card Type",
                  "Bank Card Type",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Bank Card Type can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.bank_card_type = onSavedVal;
                  },
                  initialValue: underwriteModel!.bank_card_type ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Bank Card Number',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Bank Card Number",
                  "Bank Card Number",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Bank Card Number can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.bank_card_no = onSavedVal;
                  },
                  initialValue: underwriteModel!.bank_card_no ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Bank Card Expiry Date (DD-MM-YYYY)',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Bank Card Expiry Date",
                  "Bank Card Expiry Date",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Bank Card Expiry Date can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.bank_card_expiry = onSavedVal;
                  },
                  initialValue: underwriteModel!.bank_card_expiry ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Bank Card Issuer',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Bank Card Issuer",
                  "Bank Card Issuer",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Bank Card Issuer can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    underwriteModel!.bank_card_issuer = onSavedVal;
                  },
                  initialValue: underwriteModel!.bank_card_issuer ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Divider(
                thickness: 3.0,
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(),
                child: Text(
                  'CUSTOMER HEALTH HISTORY',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 28.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Input Height',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: FormHelper.inputFieldWidget(
                  context,
                  "InputHeight",
                  "Input Height",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Height can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.height = onSavedVal;
                  },
                  initialValue: healthModel!.height ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Input Weight',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "CustomerWeight",
                  "Customer Weight",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Customer Weight can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.weight = onSavedVal;
                  },
                  initialValue: healthModel!.weight ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Has the Client Contracted Any Illness Recently?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Current Illness",
                  "Current Illness",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Age can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.current_ill = onSavedVal;
                  },
                  initialValue: healthModel!.current_ill ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                    'Has the Client Contracted Any Illness in Past 5 Years?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Past 5 Years Illness",
                  "Past 5 Years Illness",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Past 5 Years Illness can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.five_years_ill = onSavedVal;
                  },
                  initialValue: healthModel!.five_years_ill ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                    'Has the Client Participated in Any Hazardous Activities? If Yes, Please Specify',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Hazardous Activities",
                  "Hazardous Activities",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Hazardous Activities can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.hazardact = onSavedVal;
                  },
                  initialValue: healthModel!.hazardact ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                    'Has the Client Had His/Her Insurance Application Rejected Before? If Yes, Please Specify',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Rejected Insurance",
                  "Rejected Insurance",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Rejected Insurance can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.rejectinsurance = onSavedVal;
                  },
                  initialValue: healthModel!.rejectinsurance ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Is the Client a Smoker?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Smoker",
                  "Smoker",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Smoker Status can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.smoker = onSavedVal;
                  },
                  initialValue: healthModel!.smoker ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Is the Client a HIV Patient?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "HIV",
                  "HIV",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "HIV can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.hiv = onSavedVal;
                  },
                  initialValue: healthModel!.hiv ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text('Is the Client an Alcoholic?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "Alcoholic",
                  "Alcoholic",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Alcoholic can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.alcoholic = onSavedVal;
                  },
                  initialValue: healthModel!.alcoholic ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                    'Does the Customer Have Any Illness Passed Down Ancestrally?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "ANCESTRAL ILLNESS ",
                  "ANCESTRAL ILLNESS ",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "ANCESTRAL ILLNESS  can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.ancestral_ill = onSavedVal;
                  },
                  initialValue: healthModel!.ancestral_ill ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child:
                    Text('Provide the Details of Ancestral Illness of Customer',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 5),
                child: FormHelper.inputFieldWidget(
                  context,
                  "ANCESTRAL ILLNESS DESCRIPTION",
                  "ANCESTRAL ILLNESS DESCRIPTION",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "ANCESTRAL ILLNESS DESCRIPTION can't be empty";
                    }
                    return null;
                  },
                  (onSavedVal) {
                    healthModel!.ancestral_desc = onSavedVal;
                  },
                  initialValue: healthModel!.ancestral_desc ?? "",
                  borderColor: Colors.black,
                  borderFocusColor: Colors.black,
                  textColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.7),
                  borderRadius: 10,
                ),
              ),
              Center(
                  child: FormHelper.submitButton("Save", () {
                if (validateAndSave()) {
                  // API Service
                  setState(() {
                    isAPICallProcess = true;
                  });

                  APIService.saveUWForm(customerModel!, healthModel!,
                          underwriteModel!, isEditMode)
                      .then((response) {
                    setState(() {
                      isAPICallProcess = false;
                    });

                    if (response) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                          context, Config.appName, "Error Occured", "OK", () {
                        Navigator.of(context).pop();
                      });
                    }
                  });
                }
              }, borderColor: Colors.white, borderRadius: 10))
            ],
          ),
        ],
      ),
    );
  }
}
