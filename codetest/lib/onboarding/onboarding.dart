import 'package:codetest/custom_widgets.dart';
import 'package:codetest/register.dart';
import 'package:flutter/material.dart';

import 'onboarding_data.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // The Three Dots at the bottom of the chair
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  // The Single Dot
  Widget indicator(bool isCurrent) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 6.0,
      width: isCurrent ? 15.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
              top: 400,
              right: 300,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xffD3B4F0),
              )),
          const Positioned(
            top: -100,
            left: 50,
            child: CircleAvatar(
              radius: 300,
              backgroundColor: Color(0xffA95EF9),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 200,
                ),
                SizedBox(
                  height: 350,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    controller: _pageController,
                    children: const <Widget>[
                      GetOnboardingPage(
                          imagePath: 'assets/chair1.png',),
                      GetOnboardingPage(
                          imagePath: 'assets/chair1.png', ),
                      GetOnboardingPage(
                          imagePath: 'assets/chair1.png',)
                    ],
                  ),
                ),
                //Display for the three dots indicators
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator()),

                const SizedBox(
                  height: 50,
                ),

                const Center(
                    child: Text(
                  'Welcome To QuStore!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text(
                  'With long experience in the audio industry \n \t\t\t\t\twe create the best quality procucts',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                _currentPage == 2
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: QuStoreElevatedButton(onPressed:  () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                            },
                            title: 'Get Started',
                            icon: Icons.arrow_right_alt,
                            )
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160.0),
                        child: TextButton(
                            onPressed: () {
                              if (_pageController.hasClients) {
                                _pageController.animateToPage(
                                  _currentPage + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: Row(
                              children: const [
                                Text('Next'),
                                Icon(Icons.navigate_next),
                              ],
                            )),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
