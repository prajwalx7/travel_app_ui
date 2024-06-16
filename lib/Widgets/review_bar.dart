import 'package:flutter/material.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Stack(
          clipBehavior: Clip.none,
          children: [
            // First avatar
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/avatar1.jpeg'),
            ),
            // Second avatar
            Positioned(
              left: 25,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
            // Third avatar
            Positioned(
              left: 50,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatar3.jpeg'),
              ),
            ),
            // Fourth avatar
            Positioned(
              left: 75,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatar4.jpeg'),
              ),
            ),
            // "10+" circle
            Positioned(
              left: 100,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Text(
                  '10+',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 120),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Reviews'),
        ),
      ],
    );
  }
}
