import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/set_password.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _termsAccepted = false;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Back',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textSignUp,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(labelText: 'Name'),
              const CustomTextField(labelText: 'Email'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Your mobile number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  value: _selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _termsAccepted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: _termsAccepted ? Colors.green : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _termsAccepted = !_termsAccepted;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to the ',
                        style: const TextStyle(fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of service',
                            style: const TextStyle(
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy policy.',
                            style: const TextStyle(
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MainButton(
                textTheButton: 'Sign Up',
                onTap: _termsAccepted
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPasswordScreen(),
                          ),
                        );
                      }
                    : null,
              ),
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
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 137, 85, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
