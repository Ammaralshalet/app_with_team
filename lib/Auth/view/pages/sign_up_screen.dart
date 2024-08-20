import 'package:app_with_team/Auth/view/pages/set_password.dart';
import 'package:app_with_team/Auth/view/pages/welcome_screen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:app_with_team/Auth/res/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  String? _selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                CustomTextField(
                  labelText: 'Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: IntlPhoneField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {},
                    validator: (phone) {
                      if (phone == null || phone.completeNumber.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
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
                    validator: (value) {
                      if (value == null) {
                        return 'This field is required';
                      }
                      return null;
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
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: bySignUp,
                          style: TextStyle(fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Terms of service',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy policy.',
                              style: TextStyle(
                                color: Colors.green,
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
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SignUpPasswordScreen(),
                              ),
                            );
                          }
                        }
                      : null,
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
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
                  text: signGmail,
                  onTap: () {},
                  image: 'assets/Gmail.png',
                ),
                SocialLoginButton(
                  text: signFacebook,
                  onTap: () {},
                  image: 'assets/Facebook.png',
                ),
                SocialLoginButton(
                  text: signApple,
                  onTap: () {},
                  image: 'assets/Apple.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        readyText,
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
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign in',
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
        ),
      ),
    );
  }
}
