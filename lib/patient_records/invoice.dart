import 'package:flutter/material.dart';
import 'package:quorocare_project/patient_records/widgets/widgets.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Invoice/Bill'),
    ),
    body:RecordPageLayout(),    
    );
  }
}