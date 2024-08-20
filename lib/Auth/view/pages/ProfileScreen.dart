import 'package:app_with_team/Auth/res/strings.dart';
import 'package:app_with_team/Auth/view/pages/sign_in.dart';
import 'package:app_with_team/Auth/view/pages/welcome_screen.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/TextFields.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

  String selectedCity = 'Malki';
  String selectedDistrict = 'Al-Mohafaza';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Center(
              child: Text(
                textBack,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromRGBO(208, 208, 208, 1),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 14,
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField2(
              labelText: 'Full Name',
              controller: _fullNameController,
            ),
            const SizedBox(height: 20),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: yourPhone,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(208, 208, 208, 1),
                  ),
                ),
              ),
              initialCountryCode: 'BD',
            ),
            const SizedBox(height: 20),
            CustomTextField2(
              labelText: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            CustomTextField2(
              labelText: 'Street',
              controller: _streetController,
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              labelText: 'City',
              value: selectedCity,
              items: [
                'Malki',
                'Mezzeh',
                'Kafr Souseh',
                'Baramkeh',
                'Abu Rummaneh',
                'Bab Touma',
              ],
              onChanged: (value) {
                setState(() {
                  selectedCity = value!;
                  selectedDistrict = _getDistrictsForCity(value)[0];
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              labelText: 'District',
              value: selectedDistrict,
              items: _getDistrictsForCity(selectedCity),
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value!;
                });
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: MainButton2(
                    textTheButton: 'Cancel',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MainButton(
                    textTheButton: 'Save',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String labelText,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(208, 208, 208, 1),
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  List<String> _getDistrictsForCity(String city) {
    switch (city) {
      case 'Bab Touma':
        return ['Qishleh', 'Straight Street', 'Al-Hamidiyah'];
      case 'Abu Rummaneh':
        return ['Al-Muhajireen', 'Rawda', 'Sharia Al-Jalaa'];
      case 'Baramkeh':
        return ['Al-Adawi', 'Al-Mazraa', 'Al-Qanawat'];
      case 'Kafr Souseh':
        return ['Al-Afif', 'Al-Midan', 'Al-Jisr Al-Abyad'];
      case 'Mezzeh':
        return ['Mezzeh 86', 'Mezzeh Autostrade', 'Mezzeh Jabal'];
      case 'Malki':
        return ['Al-Mohafaza', 'Al-Faiha', 'Al-Muhajireen'];
      default:
        return ['Select District'];
    }
  }
}
