import 'package:app_with_team/Auth/res/colors.dart';
import 'package:app_with_team/Auth/res/padding.dart';
import 'package:flutter/material.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController password;
  final String hintText;

  const TextFieldPassword({
    super.key,
    required this.password,
    required this.hintText,
  });

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: 362,
          height: 60,
          child: TextField(
            controller: widget.password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: Padding(
                padding: iconPadding,
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _toggleVisibility,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldModel extends StatelessWidget {
  final TextEditingController ControllerText;
  final String hintText;

  const TextFieldModel({
    super.key,
    required this.ControllerText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: 362,
          height: 60,
          child: TextField(
            controller: ControllerText,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final VoidCallback toggleObscureText;

  const CustomPasswordField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.obscureText,
    required this.onChanged,
    required this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: toggleObscureText,
          ),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const CustomTextField2({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(208, 208, 208, 1),
          ),
        ),
      ),
    );
  }
}
