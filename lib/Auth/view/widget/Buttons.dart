import 'package:app_with_team/Auth/res/colors.dart';
import 'package:app_with_team/Auth/res/padding.dart';
import 'package:app_with_team/Auth/res/size.dart';
import 'package:app_with_team/Auth/res/strings.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String textTheButton;
  final VoidCallback onTap;

  const MainButton({
    super.key,
    required this.textTheButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: mainButtonSize.width,
          height: mainButtonSize.height,
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              textTheButton,
              style: const TextStyle(color: buttonTextColor),
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

  const MainButton2({
    super.key,
    required this.textTheButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: mainButtonSize.width,
            height: mainButtonSize.height,
            decoration: BoxDecoration(
                color: buttonBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: primaryColor)),
            child: Center(
              child: Text(
                textTheButton,
                style: const TextStyle(color: primaryColor),
              ),
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
