
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../../core/app_routes/routes_mames.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton.extended(onPressed: (){}, label:const Text("Next")) ,
      body: OnBoardingSlider(
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Start',
        finishButtonColor: Colors.black,
        onFinish: (){
          Navigator.pushReplacementNamed(context,RoutsNames.authentication);
        },
        skipTextButton:const Text('Skip'),
        //trailing: Text('Login'),
        background: [
           Image.asset('assets/images/img.png'),
          Image.asset('assets/images/img_1.png'),
          Image.asset('assets/images/img_2.png'),

        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('You can search anyone by username or email and add them easily'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
