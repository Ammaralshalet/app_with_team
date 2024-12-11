import 'package:app_with_team/Auth/res/colors.dart';
import 'package:app_with_team/Auth/res/padding.dart';
import 'package:app_with_team/Auth/res/strings.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String title;
  final String details;
  final String distance;
  final String imageUrl;
  final bool buttons;
  final VoidCallback onTapBooklater;
  final VoidCallback onTapRiedNow;
  final VoidCallback onTapViewCarList;

  const CarCard({
    super.key,
    required this.title,
    required this.details,
    required this.distance,
    required this.imageUrl,
    required this.buttons,
    required this.onTapBooklater,
    required this.onTapRiedNow,
    required this.onTapViewCarList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: cardPadding,
      child: Padding(
        padding: cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      details,
                      style: const TextStyle(color: greyTextColor),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_pin, color: greyTextColor),
                        const SizedBox(width: 5),
                        Text(distance,
                            style: const TextStyle(color: greyTextColor)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Image.network(imageUrl, width: 100),
              ],
            ),
            if (buttons) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onTapBooklater,
                    style: ElevatedButton.styleFrom(
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
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: onTapRiedNow,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: buttonTextColor,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(rideNowText),
                  ),
                ],
              ),
            ] else ...[
              Center(
                child: Padding(
                  padding: iconPadding,
                  child: ElevatedButton(
                    onPressed: onTapViewCarList,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(340, 54),
                      backgroundColor: buttonBackgroundColor,
                      side: const BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      viewCarListText,
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class CarReviewCard extends StatelessWidget {
  final String title;
  final double rating;
  final int reviewCount;
  final String imageUrl;

  const CarReviewCard({
    super.key,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: cardPadding,
      child: Padding(
        padding: cardPadding,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: starColor),
                    const SizedBox(width: 5),
                    Text(
                      '$rating ($reviewCount reviews)',
                      style: const TextStyle(color: greyTextColor),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Image.network(imageUrl, width: 100),
          ],
        ),
      ),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  bool isTransportSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: containerPadding,
      child: Container(
        padding: containerPadding,
        decoration: BoxDecoration(
          color: const Color(0xffB9E5D1),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: searchFieldPadding,
              decoration: BoxDecoration(
                color: const Color(0xffE2F5ED),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: searchHintText,
                        hintStyle: TextStyle(color: greyTextColor),
                      ),
                    ),
                  ),
                  Icon(Icons.favorite_border, color: borderColor),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTransportSelected = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isTransportSelected
                            ? primaryColor
                            : const Color(0xffE2F5ED),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                        ),
                      ),
                      padding: buttonPadding,
                      child: Center(
                        child: Text(
                          transportText,
                          style: TextStyle(
                            color: isTransportSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTransportSelected = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: !isTransportSelected
                            ? primaryColor
                            : const Color(0xffE2F5ED),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      padding: buttonPadding,
                      child: Center(
                        child: Text(
                          deliveryText,
                          style: TextStyle(
                            color: !isTransportSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  final String discountText;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const DiscountCard({
    super.key,
    required this.discountText,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: discountCardPadding,
      decoration: BoxDecoration(
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                discountText,
                style: const TextStyle(
                  color: orangeTextColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: const TextStyle(
                  color: greyTextColor,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: onButtonPressed,
            child: Text(
              buttonText,
              style: const TextStyle(color: buttonTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Color avatarColor;
  final Color iconColor;
  final String name;
  final String dateTime;
  final String amount;

  const TransactionCard({
    super.key,
    required this.avatarColor,
    required this.iconColor,
    required this.name,
    required this.dateTime,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: transactionCardPadding,
      decoration: BoxDecoration(
        border: Border.all(color: cardBorderColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: avatarColor,
                child: Icon(
                  Icons.arrow_upward,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    dateTime,
                    style: const TextStyle(
                      color: greyTextColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
