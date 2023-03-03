import 'package:eary/core/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_routes/routes_mames.dart';
import '../../../../core/widgets/custom_text.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF0F9FF),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            const CustomText(
              text: "EARY",
              color: Color(0xff998BE0),
            ),
            const CustomText(
              text: "No communication barrier anymore! ",
              color: Color(0xff525252C2),
            ),
            DefaultButton(
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RoutsNames.register);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              text: "login",
              onPressed: () {
                Navigator.pushNamed(context, RoutsNames.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
