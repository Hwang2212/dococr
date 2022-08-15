import 'dart:io';

import 'package:dococr/api_service.dart';
import 'package:dococr/config.dart';
import 'package:dococr/model/underwriteform_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:snippet_coder_utils/FormHelper.dart';

class UploadUnderwritingForm extends StatefulWidget {
  const UploadUnderwritingForm({Key? key}) : super(key: key);

  @override
  State<UploadUnderwritingForm> createState() => _UploadUnderwritingFormState();
}

class _UploadUnderwritingFormState extends State<UploadUnderwritingForm> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  UnderwriteFormModel? underwriteformModel;
  List<File> _image = [];
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    underwriteformModel = UnderwriteFormModel();

    Future.delayed(Duration.zero, (() {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

        underwriteformModel = arguments["model"];
      }
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void submit() {
      Navigator.of(context).pop(controller.text);
    }

    Future<String?> pdfNameDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('PDF File Name'),
              content: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Enter PDF File Name'),
                controller: controller,
              ),
              actions: [TextButton(onPressed: submit, child: Text("SUBMIT"))],
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Underwriting Form',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          (_image != null
              ? SizedBox(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _image.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              _image[index],
                            ),
                          )),
                )
              : Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                  height: 400,
                  width: 200,
                  fit: BoxFit.scaleDown,
                )),
          Center(
            child: OutlinedButton(
                onPressed: getImageFromGallery,
                child: Text(
                  'Upload from Gallery',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: Size.fromWidth(400.0),
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2.0))),
          ),
          Center(
            child: OutlinedButton(
                onPressed: getImageFromCamera,
                child: Text(
                  'Take Picture',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: Size.fromWidth(400.0),
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2.0))),
          ),
          Center(
            child: OutlinedButton(
                onPressed: () async {
                  final pdfName = await pdfNameDialog();
                  createPDF();
                  savePDF(pdfName);
                },
                child: Text(
                  'Save as PDF',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: Size.fromWidth(400.0),
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2.0))),
          ),
        ],
      ),
    );
  }

  getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No image selected');
      }
    });
  }

  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('No image selected');
      }
    });
  }

  createPDF() async {
    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  savePDF(pdfName) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/${pdfName}.pdf');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      underwriteformModel!.file_name = pdfName;
      underwriteformModel!.uw_filepath = file.path;
    });
    APIService.uploadUWForm(underwriteformModel!).then((response) {
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
}
