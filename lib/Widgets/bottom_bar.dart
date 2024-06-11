import 'package:flutter/material.dart';

class BottomBarItrem extends StatelessWidget {
  final IconData icon;
  final Function OnTap;

  const BottomBarItrem({
    super.key,
    required this.icon,
    required this.OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => OnTap(),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
