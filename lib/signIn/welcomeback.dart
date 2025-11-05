import 'package:flutter/material.dart';

class Welcomeback extends StatelessWidget {
  const Welcomeback({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(children: [Text('Welcome',style: TextStyle(fontSize: 30),), 
          Text('Back!',style: TextStyle(fontSize: 30,color: const Color.fromARGB(255, 4, 0, 129)),)]),
          SizedBox(height: 20,),
          Text('We have found 3 profiles',style: TextStyle(fontSize: 20),),
          Text('linked to +919074026293',style: TextStyle(fontSize: 20),),
          SizedBox(height: 30,),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    minLeadingWidth: 50,
                    minTileHeight: 80,
                    leading: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.blue,
                      child: Icon(Icons.person),),
                    title: Text('Simoy Rajan'),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 120,),
          Card(
            clipBehavior: Clip.hardEdge,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 15),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    spreadRadius: 10,
                    blurRadius: 7
                  )],
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentGeometry.centerRight,
                    stops: [0,1.0],
                    colors: [const Color.fromARGB(255, 0, 10, 100),Colors.blue]
                    )
                ),
                child: Text('Verify & Continue',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                ),
            ),
          Center(child: Text('Make changes in device settings at any time.Learn',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)),
          Center(child: Text('more in our privacy policy',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)),
        ],
      ),
    );
  }
}
