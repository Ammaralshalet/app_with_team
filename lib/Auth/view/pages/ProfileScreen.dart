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

  String _selectedCity = 'Select City';
  String _selectedDistrict = 'Select District';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
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
                labelText: 'Your mobile number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(208, 208, 208, 1)),
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
              value: _selectedCity,
              items: ['Select City', 'Dhaka', 'Chittagong', 'Sylhet'],
              onChanged: (value) {
                setState(() {
                  _selectedCity = value!;
                  _selectedDistrict = 'Select District';
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              labelText: 'District',
              value: _selectedDistrict,
              items: _getDistrictsForCity(_selectedCity),
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value!;
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
                      // Cancel action
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MainButton(
                    textTheButton: 'Save',
                    onTap: () {
                      // Save action
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
          borderSide: BorderSide(color: Color.fromRGBO(208, 208, 208, 1)),
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
      case 'Dhaka':
        return ['Select District', 'Gulshan', 'Banani', 'Dhanmondi'];
      case 'Chittagong':
        return ['Select District', 'Pahartali', 'Rangunia', 'Raozan'];
      case 'Sylhet':
        return ['Select District', 'Beanibazar', 'Golapganj', 'Zakirnagar'];
      default:
        return ['Select District'];
    }
  }
}
