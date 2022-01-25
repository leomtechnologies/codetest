import 'package:codetest/home_page.dart';
import 'package:codetest/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


String? email;
//Here the user 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
      runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? const Onboarding() : const HomePage());
      
  
  }
}

