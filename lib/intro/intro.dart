import 'package:digimed/main.dart';
import 'package:digimed/registrationpage.dart';
import 'package:digimed/variables.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
        title: 'Find your nearest hospital',
        body:
            'You can find your nearest hospital or you can search a hospital of your interest',
        // image: Image.asset('assets/sample.png', height: 200,),
        image: SvgPicture.asset(search),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 26,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ),
      //first page done
      PageViewModel(
        title: 'Fully specified!',
        body:
            'Once you select a hospital it shows information like contact details, specialties, adress and navigation.',
        // image: Image.asset('assets/sample.png', height: 200,),
        image: SvgPicture.asset(doctors),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 26,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ),
      PageViewModel(
        title: 'Navigate to hospital',
        body:
            'This app has built in navigation so you can find the direction to your hospital',
        // image: Image.asset('assets/sample.png', height: 200,),
        image: Lottie.asset("assets/json/hospital.json"),
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 26,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getpages(),
        done: Text(
          'Done',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: 20),
        ),
        onDone: () {
          // Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RegistrationScreen()));
        },
      ),
    );
  }
}
