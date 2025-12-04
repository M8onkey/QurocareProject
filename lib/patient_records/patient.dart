import 'package:flutter/material.dart';
import 'package:quorocare_project/patient_records/widgets/widgets.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(231, 20, 1, 142),
        title: Row(
          children: [
            Icon(Icons.arrow_back,color: Colors.white,),
            SizedBox(width: 20,),
            Text('Qurocare',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            SizedBox(width: screenWidth*0.30,),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Icon(Icons.add,size: 15,),
                  Text('Add New',style: TextStyle(fontSize: 14),)
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          buttonlist(),
          SizedBox(height: 10,),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: patientCard(screenWidth,0.5,'123456')),
          SizedBox(height: 30,),
          records(screenWidth,context)
        ],
      ),
    );
  }
}