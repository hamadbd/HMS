import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/screens/login_page/login_page.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    const bodyStyle = TextStyle(fontSize: 19.0);

    return Scaffold(
        body: Container(
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "For Hospital",
              body:
              "Advance the standards used in medical facilities in line with international standards.",
              image: Image.asset('images/slide1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "For Files",
              body:
              "Create and maintain a patient's electronic medical file.",
              image:  Image.asset('images/slide2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "For Patient",
              body:
              "Improving the patient experience when receiving health care.",
              image:  Image.asset('images/slide3.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: (){
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: LoginPage()));
          },
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Skip',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,)),
          next: const Icon(Icons.arrow_forward,color: Colors.white,),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Color(0xaf19a9b0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
