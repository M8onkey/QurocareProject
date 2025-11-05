import 'package:flutter/material.dart';
import 'package:quorocare_project/hospital_profile/widgets/widget.dart';
import 'package:quorocare_project/hospital_profile/hospital_profile2.dart';

class HospitalProfile extends StatefulWidget {
  const HospitalProfile({super.key});

  @override
  State<HospitalProfile> createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
  int? selectedIndex;

  List<String> service = [
    'Home Doctor',
    'Home Nurse',
    'Home Sample',
    'Home PhysioTherapy',
  ];

  void select(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = null;
      } else {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(height: 10),
                  Text(
                    'Choose the service you need',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => select(0),
                    child: cardHospital(
                      'Home Doctor',
                      'Consultation',
                      'hospital_profile1',
                      selectedIndex == 0 ? Colors.blue[200]! : Colors.grey[200]!,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => select(1),
                    child: cardHospital(
                      'Home Nurse',
                      'Service',
                      'hospital_profile2',
                      selectedIndex == 1 ? Colors.blue[200]! : Colors.grey[200]!,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => select(2),
                    child: cardHospital(
                      'Home Sample',
                      'Consultation',
                      'hospital_profile1',
                      selectedIndex == 2 ? Colors.blue[200]! : Colors.grey[200]!,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => select(3),
                    child: cardHospital(
                      'Home',
                      'PhysioTherapy',
                      'hospital_profile2',
                      selectedIndex == 3 ? Colors.blue[200]! : Colors.grey[200]!,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              if (selectedIndex != null)
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'select service',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 72, 154),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    service[selectedIndex!],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalProfile2()));
                                    },
                                    child: Text(
                                      'Continue >',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
