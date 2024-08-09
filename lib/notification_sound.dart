import 'package:beehyv/appcolor.dart';
import 'package:flutter/material.dart';

class NotificationSound extends StatelessWidget {
  const NotificationSound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      appBar: AppBar(
        backgroundColor: AppColors.honeyColor,
        title: const Text(
          'Notification and Sounds',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
