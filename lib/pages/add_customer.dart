import 'dart:io';

import 'package:dococr/model/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  CustomerModel? customerModel;
  bool isEditMode = false;
  bool isImageSelected = false;

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

  @override
  void initState() {
    super.initState();
    customerModel = CustomerModel();
  }

  Widget customerForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Color.fromARGB(255, 252, 252, 73),
                    minimumSize: const Size(88.0, 36.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => icPicker(false, "", (file) {}));
                },
                child: const Text("Upload IC")),
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
              initialValue: customerModel!.customer_name!,
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
              "CustomerIC",
              "Customer IC",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Customer IC can't be empty";
                }
                return null;
              },
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
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
              (onSaveVal) {},
              suffixIcon: const Icon(Icons.email_outlined),
              borderColor: Colors.black,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
            ),
          ),
          Center(
              child: FormHelper.submitButton("Save", () {},
                  borderColor: Colors.white, borderRadius: 10))
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
                    fileName,
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
