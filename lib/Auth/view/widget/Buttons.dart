import 'package:app_with_team/Auth/res/colors.dart';
import 'package:app_with_team/Auth/res/padding.dart';
import 'package:app_with_team/Auth/res/size.dart';
import 'package:app_with_team/Auth/res/strings.dart';
import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
  final String textTheButton;
  final VoidCallback? onTap;

  const MainButton({
    super.key,
    required this.textTheButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            color: onTap != null
                ? const Color.fromRGBO(0, 137, 85, 1)
                : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              textTheButton,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainButton2 extends StatelessWidget {
  final String textTheButton;
  final VoidCallback onTap;
  final bool showIcon;
  final IconData? icon;

  const MainButton2({
    super.key,
    required this.textTheButton,
    required this.onTap,
    this.showIcon = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Color.fromRGBO(0, 137, 85, 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showIcon && icon != null)
                  Icon(icon, color: Color.fromRGBO(0, 137, 85, 1)),
                if (showIcon && icon != null) SizedBox(width: 8),
                Text(
                  textTheButton,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 137, 85, 1),
                    fontSize: 16,
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

class CarDetailsButton extends StatelessWidget {
  final VoidCallback onTapBooklater;
  final VoidCallback onTapRiedNow;

  const CarDetailsButton(
      {super.key, required this.onTapBooklater, required this.onTapRiedNow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onTapBooklater,
          style: ElevatedButton.styleFrom(
            minimumSize: buttonSize,
            foregroundColor: primaryColor,
            backgroundColor: buttonBackgroundColor,
            side: const BorderSide(
              color: buttonBorderColor,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(bookLaterText),
        ),
        SizedBox(width: buttonSpacing.horizontal),
        ElevatedButton(
          onPressed: onTapRiedNow,
          style: ElevatedButton.styleFrom(
            minimumSize: buttonSize,
            foregroundColor: buttonTextColor,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(rideNowText),
        ),
      ],
    );
  }
}

class CircularProgressButton extends StatelessWidget {
  final double progress;
  final String buttonText;
  final VoidCallback onPressed;

  const CircularProgressButton({
    super.key,
    required this.progress,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
            backgroundColor: Colors.grey[200],
          ),
        ),
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: const Color.fromRGBO(0, 137, 85, 1),
          shape: const CircleBorder(),
          child: buttonText.isEmpty
              ? const Icon(Icons.arrow_forward, color: Colors.white)
              : Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String image;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: const Color.fromRGBO(0, 137, 85, 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image, height: 24),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 137, 85, 1),
                    fontSize: 16,
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
