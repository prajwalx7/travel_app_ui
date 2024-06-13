import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/avatar.jpg"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Prajwal Dudhatkar",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
