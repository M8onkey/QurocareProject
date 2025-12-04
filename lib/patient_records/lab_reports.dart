import 'package:flutter/material.dart';
import 'package:quorocare_project/patient_records/widgets/widgets.dart';

class LabReports extends StatelessWidget {
  const LabReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Reports'),
      ),
      body: RecordPageLayout2()
    );
  }
}