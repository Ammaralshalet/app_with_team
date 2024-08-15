import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';

class sing_in extends StatefulWidget {
  const sing_in({super.key});

  @override
  State<sing_in> createState() => _sing_inState();
}

class _sing_inState extends State<sing_in> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Back',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Sign in with your email or \n phone number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 20),
            CustomTextField2(
              labelText: 'Email or Phone Number',
              controller: emailController,
            ),
            const SizedBox(height: 20),
            CustomPasswordField(
              labelText: 'Enter Your Password',
              controller: passwordController,
              obscureText: obscurePassword,
              onChanged: (password) {},
              toggleObscureText: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget password?',
                  style: TextStyle(
                    color: Color.fromRGBO(243, 1, 1, 1),
                  ),
                ),
              ),
            ),
            MainButton(
                textTheButton: 'Sign Up',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ,
                  //   ),
                  // );
                }),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SocialLoginButton(
              text: 'Sign up with Gmail',
              onTap: () {},
              image: 'assets/Gmail.png',
            ),
            SocialLoginButton(
              text: 'Sign up with Facebook',
              onTap: () {},
              image: 'assets/Facebook.png',
            ),
            SocialLoginButton(
              text: 'Sign up with Apple',
              onTap: () {},
              image: 'assets/Apple.png',
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Don’t have an account? Sign Up',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 137, 85, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
