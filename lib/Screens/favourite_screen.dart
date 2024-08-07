import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';
import '../Widgets/destination_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        backgroundColor: const Color(0xffEBECF9),
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
