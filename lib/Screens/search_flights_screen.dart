import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp/Screens/booking_screen.dart';

class SearchFlightsScreen extends StatelessWidget {
  const SearchFlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Flights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Available Flights',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '08:00 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'HUI',
              landingTime: '13:00 PM',
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Book Now"),
            ),
            const FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '08:00 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'SGN',
              landingTime: '13:00 PM',
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Book Now"),
            ),
            const FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '08:00 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'HAN',
              landingTime: '13:00 PM',
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightContainer extends StatelessWidget {
  final String departureCountry;
  final String departureIATA;
  final String departureTime;
  final String landingTime;
  final String landingCountry;
  final String landingIATA;

  const FlightContainer({
    super.key,
    required this.departureCountry,
    required this.departureIATA,
    required this.departureTime,
    required this.landingCountry,
    required this.landingIATA,
    required this.landingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountryFlag.fromCountryCode(
                      height: 20,
                      width: 30,
                      'IN',
                      shape: const RoundedRectangle(3),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      departureCountry,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  departureIATA,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  departureTime,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Arrow Icon
          const Icon(Icons.arrow_right_alt, size: 40),
          // Right Side
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountryFlag.fromCountryCode(
                      height: 20,
                      width: 30,
                      'US',
                      shape: const RoundedRectangle(3),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      landingCountry,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  landingIATA,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  landingTime,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
