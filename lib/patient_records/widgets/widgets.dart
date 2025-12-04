import 'package:flutter/material.dart';
import 'package:quorocare_project/patient_records/invoice.dart';
import 'package:quorocare_project/patient_records/lab_reports.dart';

Widget buttonlist(){
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          button('Sara Salan', Image.asset('assets/grandmother.png',scale : 25), Colors.white, Colors.black,Colors.black),
          SizedBox(width: 10),
          button('ADD', Image.asset('assets/plus.png'), Colors.blue, Colors.white,Colors.white),
        ],
      ),
    ),
  );
}

Widget button(String text, Image image, Color color,Color textColor,Color iconColor){
  return Container(
    width: 120,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.grey),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(width: 5),
          Text(text,style: TextStyle(color: textColor),),
        ],
      ),
    ),
  );
}

Widget patientCard(double width,double value,String patientID){
  return Container(
    width: width*0.95,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
        color: Colors.black.withOpacity(0.2), // shadow color
        spreadRadius: 1, // makes it go evenly around the border
        blurRadius: 8,   // soft edges
        offset: Offset(0, 0), // centered shadow
      ),
      ]
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              height: 50,
              child: Stack(
                children : [ CircularProgressIndicator(
                  color: Colors.grey[400],
                  value: 1 - value,
                  backgroundColor: Colors.amber,
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Image.asset('assets/grandmother.png',scale : 20)
                  ),
                Positioned(
                  top: 25,
                  left: 2,
                  child: Container(
                    width: 30,
                    height: 20,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 229, 152),
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Center(child: Text('${((1-value)*100).toInt()}%',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),
                  ),
                )
                ]
              ),
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sara Salan'),
                    Text('Patient ID : ${patientID}')//unique patient id
                  ],
                ),
                SizedBox(width: 80,),
                Text('All Profiles >',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Divider(),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Image.asset('assets/medical.png',scale: 15,),
            SizedBox(width: 10),Text('0 Health Records')],
        ),
      ],
    ),
  );
}

Widget records(double width,BuildContext context){
  return Container(
    width: width*0.95,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
        color: Colors.black.withOpacity(0.2), // shadow color
        spreadRadius: 1, // makes it go evenly around the border
        blurRadius: 8,   // soft edges
        offset: Offset(0, 0), // centered shadow
      ),
      ]
    ),
    child: Column(
      children: [
        Align(
          alignment: AlignmentGeometry.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Medical Records',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          )
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Invoice())),
          child: recordCard(
            Image.asset('assets/invoice.png',scale: 25,), 'Invoice/Bill', 'bills',const Color.fromARGB(255, 255, 240, 195))),
        recordCard(
          Image.asset('assets/prescription.png',scale: 25,), 'Prescription/Rx', 'Rx',const Color.fromARGB(255, 255, 228, 248)),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LabReports())),
          child: recordCard(
            Image.asset('assets/syringe.png',scale: 25,), 'Lab Report', 'Reports',const Color.fromARGB(255, 253, 246, 226))),
        recordCard(
          Image.asset('assets/xray.png',scale: 25,), 'Scan/Imaging Reports', 'Reports',const Color.fromARGB(255, 249, 231, 245))
      ],
    ),
  );
}

Widget recordCard(Image image, String title, String desc,Color color){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white,
      child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: image),
          title: Text('${title}'),
          trailing: Text('0 ${desc} >'),
      ),
    ),
  );

}

Widget RecordPageLayout(){
  return Center(
    child: SizedBox(
      height: 700,
      child: ListView(
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: SizedBox(
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black.withOpacity(0.1), // shadow color
                    spreadRadius: 0.1, // makes it go evenly around the border
                    blurRadius: 5,   // soft edges
                    offset: Offset(0, 6), // centered shadow
                    ),
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search invoices',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2 Bills'),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.sort),
                      Text('Filter')
                    ],
                  ),
                )
              ],
            ),
          ),
          InvoiceCard('Dr A.Sharma','Kims Multi-Speciality Hospital Trivandrum,Kerala','Issue April 16,2024'),
          SizedBox(height: 20,),
          InvoiceCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Issue April 16,2024'),
          SizedBox(height: 20,),
          InvoiceCard('Consultation','DR. A.Sharma','Issue April 16,2024'),
          SizedBox(height: 20,),
          InvoiceCard('Consultation','DR. A.Sharma','Issue April 16,2024')
        ],
      ),
    ),
  );
}

Widget RecordPageLayout2(){
  return Center(
    child: SizedBox(
      height: 700,
      child: ListView(
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: SizedBox(
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black.withOpacity(0.1), // shadow color
                    spreadRadius: 0.1, // makes it go evenly around the border
                    blurRadius: 5,   // soft edges
                    offset: Offset(0, 6), // centered shadow
                    ),
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search invoices',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2 Bills'),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.sort),
                      Text('Filter')
                    ],
                  ),
                )
              ],
            ),
          ),
          LabCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Released on April 16,2024'),
          SizedBox(height: 20,),
          LabCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Released on April 16,2024'),
          SizedBox(height: 20,),
          LabCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Released on April 16,2024'), 
          SizedBox(height: 20,),
          LabCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Released on April 16,2024'),         
          SizedBox(height: 20,),
          LabCard('Glucose Post Prandial(FBS)-Sodium Flouride','DDRC,Labratory Neyyantikara','Released on April 16,2024'),
        ],
      ),
    ),
  );
}

Widget InvoiceCard(String title,String subtitle,String date){

  return Container(          
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 8,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
              child: Text('${title}',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                )
              ),
            Text('Rs.800')
          ],
        ),
        SizedBox(
          child: Row(  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,        
            children: [
              Container(
                width: 200,
                child:Text('${subtitle}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 191, 228, 193)
                ),
                child: Center(
                  child: Text('Paid',style: TextStyle(color: Colors.green),),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${date}'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue
              ),
              child: Center(
                child: Text('View bill',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget LabCard(String title,String subtitle,String date){

  return Container(          
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 8,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
              child: Text('${title}',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                )
              ),
            
          ],
        ),
        SizedBox(
          child: Row(  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,        
            children: [
              Container(
                width: 200,
                child:Text('${subtitle}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue
                ),
                child: Center(
                  child: Text('View Report',style: TextStyle(color: Colors.white),),
              ),
            )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${date}')
          ],
        )
      ],
    ),
  );
}