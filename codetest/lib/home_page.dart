import 'package:codetest/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform, exit;

String _email = '';
String _username = '';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {


 _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email')??'');
    });
  }

  _getUserName () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = (prefs.getString('username')??'');
    });
  }
  @override
  void initState() {
    
    super.initState();
    _getEmail();
    _getUserName();

  }
  
  @override
  Widget build(BuildContext context) {
    
    // Here the saved user name and email gets displayed after login
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffA95EF9), title: const Text('QuStore'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Center(child: Text('Welcome $_username', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              const SizedBox(height: 20,),
              Center(child: Text('Your email is: $_email')),
               const SizedBox(height: 50,),
                QuStoreElevatedButton(title: 'Log Out and Keep Data'.toUpperCase(), onPressed: () async {
                  
                 if(Platform.isAndroid) {
                    SystemNavigator.pop();
                 } else if (Platform.isIOS) {
                   exit(0);
                 }
        
               },
               icon: Icons.logout,
               ),
               const SizedBox(height: 50,),
               QuStoreElevatedButton(title: 'Log Out and Clear Data'.toUpperCase(), onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              prefs.remove('username');
                 if(Platform.isAndroid) {
                    SystemNavigator.pop();
                 } else if (Platform.isIOS) {
                   exit(0);
                 }
        
               },
               icon: Icons.logout,
               )
            ],
          ),
        ),
      ),
      
    );
  }
}
