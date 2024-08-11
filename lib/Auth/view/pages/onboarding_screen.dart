import 'package:app_with_team/Auth/res/colors.dart';
import 'package:app_with_team/Auth/res/padding.dart';
import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/enable_location_screen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingPage> _slides = [
    const OnboardingPage(
      imagePath: 'assets/Anywhere_you_are.png',
      title: anywhereYouAreTitle,
      description: descriptionText,
      buttonText: '',
    ),
    const OnboardingPage(
      imagePath: 'assets/At_anytime.png',
      title: atAnytimeTitle,
      description: descriptionText,
      buttonText: '',
    ),
    const OnboardingPage(
      imagePath: 'assets/Frame1.png',
      title: bookYourCarTitle,
      description: descriptionText,
      buttonText: '',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: iconPadding,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        _slides.length - 1,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      skipText,
                      style: TextStyle(fontSize: 18, color: skipTextColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  onPageChanged: (index) {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                  itemBuilder: (context, index) {
                    return _slides[index];
                  },
                ),
              ),
              Padding(
                padding: buttonPadding,
                child: CircularProgressButton(
                  progress: (_currentIndex + 1) / _slides.length,
                  buttonText:
                      _currentIndex == _slides.length - 1 ? goButtonText : '',
                  onPressed: () {
                    if (_currentIndex == _slides.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnableLocationScreen(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
