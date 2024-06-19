import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Pages/favourite_screen.dart';
import 'package:myapp/Pages/home_screen.dart';
import 'package:myapp/Pages/tickets_screen.dart';
import 'package:myapp/Pages/user_profile_screen.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
      ),
      home: const HomeScreen(),
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/favouritesscreen': (context) => const FavouriteScreen(),
        '/ticketsscreen': (context) => const TicketsScreen(),
        '/userprofilescreen': (context) => const UserProfile(),
      },
    );
  }
}
