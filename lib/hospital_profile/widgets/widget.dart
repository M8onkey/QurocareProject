import 'package:flutter/material.dart';

Widget cardHospital(String title, String subtitle, String image, Color color) {
  return Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(subtitle),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/$image.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                      stops: [0,2],
                      colors: [const Color.fromARGB(255, 0, 10, 100),Colors.white]
                    )
                  ),
                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 15,fontWeight: FontWeight.bold,)),
                  SizedBox(width: 10,)
              ],
            )
          ],
        ),
      ],
    ),
  );
}
