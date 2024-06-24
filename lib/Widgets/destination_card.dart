import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../Data/travel_destination.dart';
import '../Screens/home_detail_screen.dart';
import '../Screens/favourites_provider.dart';

class DestinationCard extends StatelessWidget {
  final TravelDestination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.isFavorite(destination);
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 8),
          margin: const EdgeInsets.only(top: 16),
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(destination.imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        destination.price,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isFavorite) {
                          favoritesProvider.removeFavorite(destination);
                        } else {
                          favoritesProvider.addFavorite(destination);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          isFavorite ? Iconsax.heart5 : Iconsax.heart,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 162),
                    height: 130,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  destination.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.location,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Text(
                                  destination.location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.star1,
                                  size: 22,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  destination.rating,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => HomeDetailPage(
                                          destination: destination),
                                      transition: Transition.zoom,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Explore",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Iconsax.arrow_circle_right4,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
