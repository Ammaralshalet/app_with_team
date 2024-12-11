import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/profileScreen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';

class SignUpPasswordScreen extends StatefulWidget {
  const SignUpPasswordScreen({super.key});

  @override
  _SignUpPasswordScreenState createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isPasswordValid = false;
  bool _doPasswordsMatch = false;

  String _passwordErrorMessage = '';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPasswordField(
                labelText: enterPassword,
                controller: _passwordController,
                obscureText: _obscurePassword,
                onChanged: (password) {
                  _validatePassword(password);
                  _checkPasswordsMatch(_confirmPasswordController.text);
                },
                toggleObscureText: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              CustomPasswordField(
                labelText: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                onChanged: (confirmPassword) {
                  _checkPasswordsMatch(confirmPassword);
                },
                toggleObscureText: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
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
              MainButton(
                textTheButton: 'Register',
                onTap: (_isPasswordValid && _doPasswordsMatch)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileScreen(),
                          ),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = _isPasswordCompliant(password);
      _passwordErrorMessage = _isPasswordValid ? '' : passwordPermissions;
    });
  }

  void _checkPasswordsMatch(String confirmPassword) {
    setState(() {
      _doPasswordsMatch = _passwordController.text == confirmPassword;
      if (!_doPasswordsMatch && _isPasswordValid) {
        _passwordErrorMessage = passwordSimilarity;
      } else if (_isPasswordValid && _doPasswordsMatch) {
        _passwordErrorMessage = '';
      }
    });
  }

  bool _isPasswordCompliant(String password) {
    final regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }
}
