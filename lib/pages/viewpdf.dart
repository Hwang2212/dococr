import 'package:dococr/api_service.dart';
import 'package:dococr/model/underwriteform_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomerPDFViewer extends StatefulWidget {
  const CustomerPDFViewer({super.key, required this.customer});

  final customer;

  @override
  State<CustomerPDFViewer> createState() => _CustomerPDFViewerState();
}

class _CustomerPDFViewerState extends State<CustomerPDFViewer> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Recent Underwriting Form - ' + widget.customer.customer_name,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            loadpdf(),
          ],
        ));
  }

  Widget loadpdf() {
    return FutureBuilder(
      future: APIService.getPDFByCustomerID(widget.customer.id.toString()),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<UnderwriteFormModel>?> model,
      ) {
        if (model.hasData) {
          return pdfViewer(model.data);
        } else {
          return Text("No Health History");
        }
      },
    );
  }
}

Widget pdfViewer(pdf) {
  return SingleChildScrollView(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          height: 650,
          child: SfPdfViewer.network(
              'https://drive.google.com/uc?id=' + pdf[0].uw_driveid))
    ],
  ));
}
