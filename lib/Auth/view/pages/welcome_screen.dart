import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/welcome.png',
              height: responsive.getHeightPercentage(30),
            ),
            const SizedBox(height: 20),
            const Flexible(
              child: Column(
                children: [
                  Text(
                    welcome,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    textExperience,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  MainButton(
                    textTheButton: creatAccount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  MainButton2(
                    textTheButton: 'Log In',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
