import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEBECF9),
        appBar: AppBar(
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Column(
          children: [Container()],
        ));
  }
}
