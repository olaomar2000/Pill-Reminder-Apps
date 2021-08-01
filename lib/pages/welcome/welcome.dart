// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// class welcome_Page extends StatefulWidget {
//   @override
//   State<welcome_Page> createState() => _welcome_PageState();
// }
//
// class _welcome_PageState extends State<welcome_Page> {
//
//   final int _numPages = 3;
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;
//
//   List<Widget> _buildPageIndicator() {
//     List<Widget> list = [];
//     for (int i = 0; i < _numPages; i++) {
//       list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//     }
//     return list;
//   }
//
//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 150),
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       height: 8.0,
//       width: isActive ? 24.0 : 16.0,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.white : Color(0xFF7B51D3),
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 40.0),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ))),
//                     child: Text('Skip'),
//                     onPressed: () {},
//                   ),
//                 ),
//
//
//               ]),
//         ),
//       ),
//     );
//   }
// }
//

// //
// //       pages: [
// //         PageViewModel(
// //           title: "Your Virtual Nurse",
// //           body:
// //           "Instead of having to buy an entire share, invest any amount you want.",
// //           image: _buildImage('w1.jpg'),
// //           decoration: pageDecoration,
// //         ),
// //         PageViewModel(
// //           title: "Health Reminder",
// //           body:
// //           "Download the Stockpile app and master the market with our mini-lesson.",
// //           image: _buildImage('w2.png'),
// //           decoration: pageDecoration,
// //         ),
// //
// //         PageViewModel(
// //           title: "Your Caring Partner",
// //           body: "Another beautiful body text for this example onboarding",
// //           image: _buildImage('img2.jpg'),
// //           footer: ElevatedButton(
// //             onPressed: () {
// //               introKey.currentState?.animateScroll(0);
// //             },
// //             child: const Text(
// //               'FooButton',
// //               style: TextStyle(color: Colors.white),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               primary: Colors.lightBlue,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(8.0),
// //               ),
// //             ),
// //           ),
// //           decoration: pageDecoration,
// //         ),
// //
// //       ],
// //       onDone: () => _onIntroEnd(context),
// //       //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
// //       showSkipButton: true,
// //       skipFlex: 0,
// //       nextFlex: 0,
// //       //rtl: true, // Display as right-to-left
// //       skip:  ElevatedButton(onPressed:(){},
// //         child: Text('Sing up',style: TextStyle(color: Colors.black),),
// //         style: ButtonStyle(
// //           backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
// //         ),
// //       ),
// //       next:  ElevatedButton(onPressed:(){},
// //         child: Text('Log in',style: TextStyle(color: Colors.white),),
// //         style: ButtonStyle(
// //           backgroundColor: MaterialStateProperty.all<Color>(Color(0xffda8297)),
// //         ),
// //       ),
// //       done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
// //       curve: Curves.fastLinearToSlowEaseIn,
// //       controlsMargin: const EdgeInsets.all(16),
// //       controlsPadding: kIsWeb
// //           ? const EdgeInsets.all(12.0)
// //           : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
// //       dotsDecorator: const DotsDecorator(
// //         size: Size(10.0, 10.0),
// //         color: Color(0xffFCCED8),
// //         activeSize: Size(22.0, 10.0),
// //         activeColor: Color(0xffda8297),
// //         activeShape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.all(Radius.circular(25.0)),
// //         ),
// //       ),
// //
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Home')),
// //       body: const Center(child: Text("This is the screen after Introduction")),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final kTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'CM Sans Serif',
    fontSize: 26.0,
    height: 1.5,
  );

  final kSubtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    height: 1.2,
  );
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
                  child: Text('Skip'),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding0.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'Connect people\naround the world',
                            style: kTitleStyle,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding1.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'Live your life smarter\nwith us!',
                            style: kTitleStyle,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding2.png',
                              ),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'Get a new experience\nof imagination',
                            style: kTitleStyle,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Get started'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
