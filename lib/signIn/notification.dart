import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stay Informed About Your',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text('Health Status!',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            Text('Allow push notifications to get real-time updates on your appointments etc...',style: TextStyle(fontSize: 17),),
            Image.asset('assets/doctor.png'),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 70,vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(200,35, 19, 145)
                    ),
                    child: Text('Turn on Notification',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 20,),
                  Text('Not now',style: TextStyle(fontSize: 20,color: const Color.fromARGB(200,35, 19, 145)),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}