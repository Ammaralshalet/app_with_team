// import 'package:bicycle_rental_app/Auth/view/widget/Buttons.dart';
// import 'package:bicycle_rental_app/Auth/view/widget/Card.dart';
// import 'package:bicycle_rental_app/Auth/view/widget/Drawer.dart';
// import 'package:bicycle_rental_app/Auth/view/widget/TextFields.dart';
import 'package:app_with_team/Auth/view/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          // drawer:
          //  ClipRRect(
          //     borderRadius: BorderRadius.only(
          //       topRight: Radius.circular(70),
          //       bottomRight: Radius.circular(70),
          //     ),
          //     child: MyDrawer()),
          body: OnboardingScreen()
          // ListView(
          //   children: [
          //     CarCard(
          //       title: 'BMW Cabrio',
          //       details: 'Automatic | 3 seats | Octane',
          //       distance: '800m (5mins away)',
          //       imageUrl:
          //           'https://c0.klipartz.com/pngpicture/270/720/sticker-png-bmw-m5-mid-size-car-bmw-5-series-car-compact-car-sedan-headlamp-car-performance-car.png',
          //       buttons: true,
          //       onTapBooklater: () {},
          //       onTapRiedNow: () {},
          //       onTapViewCarList: () {},
          //     ),
          //     CarCard(
          //       title: 'BMW Cabrio',
          //       details: 'Automatic | 3 seats | Octane',
          //       distance: '800m (5mins away)',
          //       imageUrl:
          //           'https://c0.klipartz.com/pngpicture/270/720/sticker-png-bmw-m5-mid-size-car-bmw-5-series-car-compact-car-sedan-headlamp-car-performance-car.png',
          //       buttons: false,
          //       onTapBooklater: () {},
          //       onTapRiedNow: () {},
          //       onTapViewCarList: () {},
          //     ),
          //     const CarReviewCard(
          //       title: 'Mustang Shelby GT',
          //       rating: 4.9888,
          //       reviewCount: 531,
          //       imageUrl:
          //           'https://c0.klipartz.com/pngpicture/270/720/sticker-png-bmw-m5-mid-size-car-bmw-5-series-car-compact-car-sedan-headlamp-car-performance-car.png',
          //     ),
          //     MainButton(
          //       textTheButton: 'textTheButton',
          //       onTap: () {},
          //     ),
          //     TextFieldPassword(
          //         password: TextEditingController(), hintText: 'sds0'),
          //     TextFieldModel(
          //         ControllerText: TextEditingController(), hintText: 'hintText'),
          //     MyCustomWidget(),
          //     DiscountCard(
          //       discountText: '15% off',
          //       description: 'Black Friday',
          //       buttonText: 'Collect',
          //       onButtonPressed: () {},
          //     ),
          //     const SizedBox(height: 16.0),
          //     const TransactionCard(
          //       avatarColor: Colors.black,
          //       iconColor: Colors.red,
          //       name: 'Welton',
          //       dateTime: 'Today at 09:20 am',
          //       amount: '-\$570.00',
          //     ),
          //     CarDetailsButton(
          //       onTapBooklater: () {},
          //       onTapRiedNow: () {},
          //     )
          //   ],
          // ),
          ),
    );
  }
}
