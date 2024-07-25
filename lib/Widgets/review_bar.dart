import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // First avatar
            CircleAvatar(
              radius: 20.r,
              backgroundImage: const AssetImage('assets/avatar1.jpeg'),
            ),
            // Second avatar
            Positioned(
              left: 25.w,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage('assets/avatar.jpg'),
              ),
            ),
            // Third avatar
            Positioned(
              left: 50.w,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage('assets/avatar3.jpeg'),
              ),
            ),
            // Fourth avatar
            Positioned(
              left: 75.w,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage('assets/avatar4.jpeg'),
              ),
            ),
            // "10+" circle
            Positioned(
              left: 100.w,
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.white,
                child: const Text(
                  '10+',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 120.w),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: const Text('Reviews'),
        ),
      ],
    );
  }
}
