import 'package:flutter/material.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        title: const Text("Tickets"),
        centerTitle: true,
      ),
      body: const Center(child: Text("No Tickets Booked Yet")),
    );
  }
}
