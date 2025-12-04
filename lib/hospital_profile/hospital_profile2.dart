import 'package:flutter/material.dart';

class HospitalProfile2 extends StatelessWidget {
  const HospitalProfile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/hospital.png', fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home Doctor Consultation',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text('With Qurocare Home Doctor Service, a trusted'),
                  Text('healthcare specialist will visit you at the comfort'),
                  Text('of your home, providing consultation and care'),
                  Text('tailored to your needs.'),
                  SizedBox(height: 50),
                  Text('The service is available from:'),
                  Text('07:00AM - 09:00PM on Monday - Friday'),
                  Text('07:00AM - 08:00PM on Saturday'),
                  SizedBox(height: 150),
                  Center(
                    child: Container(
                      height: 90,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(631, 99, 79, 239),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Doctor consultation',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(231, 20, 1, 142),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Choose your location',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
