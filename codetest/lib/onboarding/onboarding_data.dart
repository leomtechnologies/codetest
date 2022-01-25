 import 'package:flutter/material.dart';

class GetOnboardingPage extends StatelessWidget {
  final String imagePath;
  
  const GetOnboardingPage({required this.imagePath,});


  @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         const SizedBox(height: 45.0),
         SizedBox(
           height: 300,
           width: 300,
             child: Image.asset(imagePath)),

        
       ],
     );
   }
 }


