 import 'package:flutter/material.dart';

class GetOnboardingPage extends StatelessWidget {
  final String imagePath;
  
  const GetOnboardingPage({required this.imagePath,});


  @override
   Widget build(BuildContext context) {
      var constraints = MediaQuery.of(context);
     var widthFactor = constraints.size.width/392.72727272727275;
    var heightFactor = constraints.size.height/781.0909090909091;
     return Column(
       children: [
          SizedBox(height: 45.0*heightFactor),
         SizedBox(
           height: 300*heightFactor,
           width: 300*widthFactor,
             child: Image.asset(imagePath)),

        
       ],
     );
   }
 }


