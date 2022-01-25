import 'package:codetest/custom_widgets.dart';
import 'package:codetest/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String username = '';
  String password = '';
  bool isUserNameComplete = false;
  bool obscureText = true;
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined),
                    Text('Lagos, Nigeria')
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Getting Started',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create an account to continue!',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email'),
                      QuStoreFormeField(
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.length < 3
                            ? 'Enter a valid email address'
                            : null,
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          size: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text('Username'),
                      QuStoreFormeField(
                        onChanged: (val) {
                          setState(() {
                            username = val;
                            val.length > 3 ? isUserNameComplete = true : false;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.length < 3
                            ? 'Enter a username with more than 3 characters'
                            : null,
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.person_outline),
                        suffixIcon: isUserNameComplete
                            ? const Icon(Icons.check)
                            : const Icon(
                                Icons.check,
                                size: 0,
                              ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text('Password'),
                      QuStorePasswordField(
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        obscureText: obscureText,
                        textInputAction: TextInputAction.done,
                        validator: (val) => val!.length < 3
                            ? 'Enter a password with atleast 4 characters'
                            : null,
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Raleway Regular',
                              fontSize: 15,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                  text:
                                      'By creating an account you agree to our'),
                              TextSpan(
                                  text: '  Terms and Conditions',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                QuStoreElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                    // Saving the username and email
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('email', email);
                    prefs.setString('username', username);
                  },
                  title: 'Sign Up'.toUpperCase(),
                  icon: Icons.login,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
