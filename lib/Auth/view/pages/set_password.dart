import 'package:app_with_team/Auth/view/pages/ProfileScreen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';

class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({super.key});

  @override
  SignUpPasswordScreenState createState() => SignUpPasswordScreenState();
}

class SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isPasswordValid = false;
  bool doPasswordsMatch = false;

  String _passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Back',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // حقل إدخال كلمة المرور
              CustomPasswordField(
                labelText: 'Enter Your Password',
                controller: _passwordController,
                obscureText: obscurePassword,
                onChanged: (password) {
                  _validatePassword(password);
                  _checkPasswordsMatch(_confirmPasswordController.text);
                },
                toggleObscureText: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              // حقل تأكيد كلمة المرور
              CustomPasswordField(
                labelText: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: obscureConfirmPassword,
                onChanged: (confirmPassword) {
                  _checkPasswordsMatch(confirmPassword);
                },
                toggleObscureText: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),
              const SizedBox(height: 8),
              if (_passwordErrorMessage.isNotEmpty)
                Text(
                  _passwordErrorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              const SizedBox(height: 20),
              // زر التسجيل
              MainButton(
                textTheButton: 'Register',
                onTap: (isPasswordValid && doPasswordsMatch)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompleteProfileScreen(),
                          ),
                        );
                        print('Password and confirmation match.');
                      }
                    : null, // تعطيل الزر إذا كانت الكلمات غير متطابقة أو غير صالحة
              ),
            ],
          ),
        ),
      ),
    );
  }

  // التحقق من صحة كلمة المرور
  void _validatePassword(String password) {
    setState(() {
      isPasswordValid = _isPasswordCompliant(password);
      _passwordErrorMessage = isPasswordValid
          ? ''
          : 'The password does not meet the conditions: it must contain an uppercase letter, a lowercase letter, and a special character.';
    });
  }

  // التحقق من تطابق كلمتي المرور
  void _checkPasswordsMatch(String confirmPassword) {
    setState(() {
      doPasswordsMatch = _passwordController.text == confirmPassword;
      if (!doPasswordsMatch && isPasswordValid) {
        _passwordErrorMessage =
            'The two passwords do not match. Please re-enter your password.';
      } else if (isPasswordValid && doPasswordsMatch) {
        _passwordErrorMessage = ''; // تطابق وكل شيء صحيح
      }
    });
  }

  // التحقق من شروط كلمة المرور
  bool _isPasswordCompliant(String password) {
    final regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }
}
