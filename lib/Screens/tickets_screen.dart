import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: TicketWidget(
          isCornerRounded: true,
          width: double.infinity,
          height: 450.h,
          child: const TicketData(),
        ),
      ),
    );
  }
}
