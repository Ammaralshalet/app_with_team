import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Your mobile number'),
              keyboardType: TextInputType.phone,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
              textTheButton: 'Sign up',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            const Text(
              'or',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MainButton(
              textTheButton: 'Sign up with Gmail',
              onTap: () {},
            ),
            MainButton(
              textTheButton: 'Sign up with Facebook',
              onTap: () {},
            ),
            MainButton(
              textTheButton: 'Sign up with Apple',
              onTap: () {},
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Already have an account? Sign in',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
