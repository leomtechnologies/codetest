import 'package:codetest/custom_widgets.dart';
import 'package:codetest/register.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
    var constraints = MediaQuery.of(context);
     var widthFactor = constraints.size.width/392.72727272727275;
    var heightFactor = constraints.size.height/781.0909090909091;
    print(constraints.size.height);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
               Positioned(
                  top: 400 * heightFactor,
                  right: 300 * widthFactor,
                  child: CircleAvatar(
                    radius: 100 * widthFactor,
                    backgroundColor: const Color(0xffD3B4F0),
                  )),
               Positioned(
                top: -100 *heightFactor,
                left: 50*widthFactor,
                child: CircleAvatar(
                  radius: 300*widthFactor,
                  backgroundColor: const Color(0xffA95EF9),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     SizedBox(
                      height: 200*heightFactor,
                    ),
                    SizedBox(
                      height: 350 *heightFactor,
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
          
                     SizedBox(
                      height: 50*heightFactor,
                    ),
          
                     Center(
                        child: Text(
                      'Welcome To QuStore!',
                      style: TextStyle(fontSize: 20*heightFactor, fontWeight: FontWeight.bold),
                    )),
                     SizedBox(
                      height: 10 *heightFactor,
                    ),
                    const Center(
                        child: Text(
                      'With long experience in the audio industry \n \t\t\t\t\twe create the best quality procucts',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                     SizedBox(
                      height: 20 * heightFactor,
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
                            padding: EdgeInsets.symmetric(horizontal: 160.0*widthFactor),
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
                                  children:  [
                                    Text('Next', style: TextStyle(fontSize: 15 *heightFactor),),
                                    Icon(Icons.navigate_next, size:  15 * heightFactor,),
                                  ],
                                )),
                          )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
