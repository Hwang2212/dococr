import 'dart:developer';
import 'dart:io';

import 'package:dococr/api_service.dart';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:dococr/model/health.model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:file_picker/file_picker.dart';

class AddEditHealth extends StatefulWidget {
  const AddEditHealth({Key? key, required this.customer}) : super(key: key);
  static const routeName = "/add-edit-health";

  final customer;

  @override
  State<AddEditHealth> createState() => _AddHealthState();
}

class _AddHealthState extends State<AddEditHealth> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  HealthModel? healthModel;
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Client Health Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: healthForm(),
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
    healthModel = HealthModel();

    Future.delayed(Duration.zero, (() {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        healthModel = arguments["model"];

        setState(() {
          isEditMode = true;
        });
      }
    }));
  }

  Widget healthForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text('Underwriting Form ID',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "Underwriting Form ID",
              "Underwriting Form ID",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Underwritng Form ID can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                healthModel!.uw_id = int.parse(onSavedVal);
              },
              initialValue: healthModel!.uw_id.toString(),
              borderColor: Colors.black,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
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
            child:
                Text('Has the Client Contracted Any Illness in Past 5 Years?',
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
            child: Text('Provide the Details of Ancestral Illness of Customer',
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

              APIService.saveHealth(healthModel!, isEditMode,
                      int.parse(widget.customer.id.toString()))
                  .then((response) {
                setState(() {
                  print(widget.customer.id);

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
    );
  }
}
