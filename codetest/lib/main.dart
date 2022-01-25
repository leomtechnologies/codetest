import 'package:codetest/home_page.dart';
import 'package:codetest/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Here the user gets redirected to the home screen or onboardingscreen if the user is logged in or not
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
      runApp(MaterialApp(home: email == null ? const Onboarding() : const HomePage()));
}


