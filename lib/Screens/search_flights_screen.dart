import 'package:flutter/material.dart';
import 'package:myapp/Screens/booking_screen.dart';

class SearchFlightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Available Flights',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 22.0),
        child: Column(
          children: [
            FlightContainer(),
            SizedBox(height: 25),
            FlightContainer(),
            SizedBox(height: 25),
            FlightContainer(),
          ],
        ),
      ),
    );
  }
}

class FlightContainer extends StatelessWidget {
  const FlightContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Flight Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingScreen()),
              );
            },
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
