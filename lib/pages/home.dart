import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _scanning = false;
  String _extractText = '';
  File _pickedImage = new File('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Doc OCR',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(children: [
          _pickedImage == File('')
              ? Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    size: 300,
                    color: Colors.black,
                  ),
                )
              : Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: FileImage(_pickedImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_upward),
                label: Text('Upload File'),
                onPressed: () async {
                  setState(() {
                    _scanning = true;
                  });

                  var image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  _pickedImage = File(image!.path);

                  if (_pickedImage == null) return null;
                  _extractText =
                      await FlutterTesseractOcr.extractText(_pickedImage.path);
                  setState(() {
                    _scanning = false;
                  });
                },
              )),
          SizedBox(
            height: 20,
          ),
          _scanning
              ? Center(child: CircularProgressIndicator())
              : Icon(
                  Icons.done,
                  size: 40,
                  color: Colors.green,
                ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              _extractText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ]));
  }
}
