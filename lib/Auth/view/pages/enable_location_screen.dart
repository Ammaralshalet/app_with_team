import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/welcome_screen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:flutter/material.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 340,
              height: 459,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/Location.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    enableLocation,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    chooseLocation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  MainButton(
                    textTheButton: useLocation,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                      style: const ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(
                          Size(
                            310,
                            54,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        skipForNow,
                        style: TextStyle(
                          color: Color(0xffE6F6F6),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
