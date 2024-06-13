import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: const Center(child: Text("No Favourites Yet!")),
    );
  }
}
