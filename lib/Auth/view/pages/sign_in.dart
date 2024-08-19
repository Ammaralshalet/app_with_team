import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/sign_up_screen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          textBack,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
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
                child: const Text(
                  textSignIn,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    haveAccount,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 137, 85, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
