import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_flags/country_flags.dart';
import 'package:myapp/Screens/booking_screen.dart';

class SearchFlightsScreen extends StatelessWidget {
  const SearchFlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Flights'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '01:45 PM',
              landingCountry: 'Vietnam',
              landingIATA: 'HUI',
              landingTime: '08:15 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
            ),
            const SizedBox(height: 20),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '09:00 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'SGN',
              landingTime: '04:30 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
            ),
            const SizedBox(height: 20),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '11:30 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'HAN',
              landingTime: '06:00 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
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
  final VoidCallback? onPressed;

  const FlightContainer({
    super.key,
    required this.departureCountry,
    required this.departureIATA,
    required this.departureTime,
    required this.landingCountry,
    required this.landingIATA,
    required this.landingTime,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side - Departure
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              // Right Side - Landing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryFlag.fromCountryCode(
                          height: 20,
                          width: 30,
                          'VN',
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
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onPressed,
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
    );
  }
}
