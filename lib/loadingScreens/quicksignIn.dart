import 'package:flutter/material.dart';

class QuickSignIn extends StatelessWidget {
  const QuickSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen sign-in wallpaper
          Positioned.fill(
            child: Image.asset(
              'assets/SignIn.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Static blue-to-black vertical gradient overlay (not animated)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(230, 0, 40, 182), // Blue with 0.9 opacity
                  Colors.black.withOpacity(1),   // Black with 0.9 opacity
                ],
              ),
            ),
          ),
          // PLACE YOUR SIGN-IN BUTTONS, FIELDS ETC. HERE AS MORE STACK CHILDREN
        Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/quro3.png',fit: BoxFit.cover,width: screenWidth*0.7,),
              SizedBox(height: 120,),
              Container(
                margin: EdgeInsets.only(right: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Every Health',style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),),
                    Text('Every Care.',style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 220,),
              Text('Sign In using your mobile number',style: TextStyle(fontSize: 15, color: Colors.white),),
              SizedBox(height: 10,),
            GestureDetector(onTap: () {
              }, child: Image.asset('assets/signbutton.png',fit: BoxFit.cover,width: screenWidth*0.8,)),
              SizedBox(height: 10,),
              Text('By signing up, you agree to our Terms , See how ',style: TextStyle(fontSize: 12, color: Colors.white),),
              Text('we use your data in our Privacy Policy.',style: TextStyle(fontSize: 12, color: Colors.white),),
            ],
          ),
        )
        ],
      ),
    );
  }
}