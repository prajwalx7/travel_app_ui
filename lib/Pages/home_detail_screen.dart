import 'package:flutter/material.dart';
import 'package:myapp/Data/travel_destination.dart';
import 'package:myapp/Pages/home_screen.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.destination});

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              destination.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const Icon(Icons.notifications, color: Colors.white),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            destination.rating,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        destination.location,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Arenal Volcano is an active andesitic stratovolcano in north-western Costa Rica around 90 km northwest of San José, in the province of Alajuela, canton of San Carlos, and district of La Fortuna.',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage('assets/avatar.jpg'),
                                ),
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.group, color: Colors.white),
                            label: const Text(
                              'Reviews',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            destination.price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Book Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
