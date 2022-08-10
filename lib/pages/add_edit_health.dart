import 'dart:developer';
import 'dart:io';

import 'package:dococr/api_service.dart';
import 'package:dococr/config.dart';
import 'package:dococr/model/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:file_picker/file_picker.dart';

class AddEditHealth extends StatefulWidget {
  const AddEditHealth({Key? key}) : super(key: key);
  static const routeName = "/add-edit-health";

  @override
  State<AddEditHealth> createState() => _AddHealthState();
}

class _AddHealthState extends State<AddEditHealth> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  CustomerModel? customerModel;
  bool isEditMode = false;
  String? selectedImage;
  bool isImageSelected = false;
  bool isImageDrive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Client Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ProgressHUD(
        child: Form(
          key: globalKey,
          child: customerForm(),
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

    Future.delayed(Duration.zero, (() {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        customerModel = arguments["model"];

        setState(() {
          isEditMode = true;
        });
      }
    }));
  }

  Widget customerForm() {
    if (customerModel!.customer_ic_driveid != null &&
        isImageSelected == false) {
      isImageDrive == true;
      selectedImage = customerModel!.customer_ic_driveid;
    } else {
      selectedImage = customerModel!.customer_ic_path ?? "";
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: icPicker(isImageSelected, selectedImage!, (file) {
                    setState(() {
                      isImageSelected = true;
                      // File Path for Customer IC
                      customerModel!.customer_ic_path = file.path;
                      selectedImage = customerModel!.customer_ic_path;
                    });
                  }),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
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
          Center(
              child: FormHelper.submitButton("Save", () {
            if (validateAndSave()) {
              // API Service
              setState(() {
                isAPICallProcess = true;
              });

              APIService.saveCustomers(
                      customerModel!, isEditMode, isImageSelected)
                  .then((response) {
                setState(() {
                  print(customerModel!.toJson());
                  print(isEditMode);

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

  static Widget icPicker(
    bool isICSelected,
    String fileName,
    Function onFilePicked,
  ) {
    Future<XFile?> _imageFile;
    ImagePicker _picker = ImagePicker();

    return Column(
      children: [
        fileName.isNotEmpty
            ? isICSelected
                ? Image.file(
                    File(fileName),
                    height: 200,
                    width: 200,
                  )
                : SizedBox(
                    child: Image.network(
                    'https://drive.google.com/uc?id=' + fileName,
                    height: 200,
                    width: 200,
                    fit: BoxFit.scaleDown,
                  ))
            : SizedBox(
                child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                height: 200,
                width: 200,
                fit: BoxFit.scaleDown,
              )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              height: 50,
              width: 250.0,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                icon: Icon(Icons.camera),
                label: Text('Upload by Camera'),
                onPressed: () {
                  _imageFile = _picker.pickImage(source: ImageSource.camera);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              height: 50,
              width: 250.0,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                icon: Icon(Icons.arrow_upward),
                label: Text('Upload File'),
                onPressed: () {
                  _imageFile = _picker.pickImage(source: ImageSource.gallery);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              )),
        ),
      ],
    );
  }
}
