import 'package:flutter/material.dart';
import 'package:myapp/Data/ticket_data.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Tickets"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 22),
        child: TicketWidget(
          isCornerRounded: true,
          width: 350,
          height: 500,
          child: TicketData(),
        ),
      ),
    );
  }
}
