import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';
import '../Widgets/destination_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            final favoriteDestinations = favoritesProvider.favorites;

            if (favoriteDestinations.isEmpty) {
              return const Center(
                child: Text('No favorites added yet.'),
              );
            }

            return ListView.builder(
              itemCount: favoriteDestinations.length,
              itemBuilder: (context, index) {
                final destination = favoriteDestinations[index];
                return DestinationCard(destination: destination);
              },
            );
          },
        ),
      ),
    );
  }
}
