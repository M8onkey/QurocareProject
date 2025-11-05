import 'package:flutter/material.dart';
import 'package:quorocare_project/services/widgets/banners.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            'Services',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Today with Quorocare helps you',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            "skip tomorrow's critical care.",
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 112, 39, 176),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cards('services1', 'Clinic Doctor', 'Consultation'),
              SizedBox(width: 10),
              cards('services2', 'Home doctor', 'Service'),
              SizedBox(width: 10),
              cards('services3', 'Home Nurse', 'Service'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              cards('services4', 'Lab Test', 'Services'),
              SizedBox(width: 10),
              cards('services5', 'Physiotherapy', 'Services'),
            ],
          ),
        ],
      ),
    );
  }
}
