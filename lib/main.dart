import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/booking_screen.dart';
import 'package:myapp/Screens/favourite_screen.dart';
import 'package:myapp/Screens/favourites_provider.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Screens/tickets_screen.dart';
import 'package:myapp/Screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => FavoritesProvider(), child: const TravelApp()));
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
      ),
      home: const HomeScreen(),
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/favouritesscreen': (context) => const FavoritesScreen(),
        '/ticketsscreen': (context) => const TicketsScreen(),
        '/userprofilescreen': (context) => const UserProfile(),
        '/bookingscreen': (context) => const BookingScreen(),
      },
    );
  }
}
