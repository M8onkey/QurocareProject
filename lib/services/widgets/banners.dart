import 'package:flutter/material.dart';

Widget banners() {
  return Center(
    child: Container(
      height: 130,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget cards(String image, String title, String subtitle) {
  return Container(
    height: 105,
    width: 105,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/$image.png',
            fit: BoxFit.cover,
            height: 60,
            width: 60,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: TextStyle(fontSize: 10)),
      ],
    ),
  );
}
