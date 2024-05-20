import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: const Icon(Icons.sort)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Row(
                  children: [
                    Text(
                      "Find the trip \nof your dreams",
                      style: TextStyle(fontSize: 22),
                    ),
                    Spacer(),
                    Icon(Icons.settings)
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      "America",
                      "Japan",
                      "Paris",
                      "France",
                      "America",
                      "Japan",
                      "Paris",
                      "France",
                      "America",
                      "Japan",
                      "Paris",
                      "France"
                    ]
                        .map((city) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              city,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            )))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    margin: const EdgeInsets.only(top: 16),
                    height: 300,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/photo3.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Row(
                            children: [
                              BlurWidget(
                                child: Text(
                                  "\$400/Person",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              BlurWidget(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: SizedBox(
                            width: 500,
                            child: Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mount Fuji",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Japan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BlurWidget(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                          Text(
                                            "4.5",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 70, right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()));
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
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.arrow_right_alt,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlurWidget extends StatelessWidget {
  final Widget child;
  const BlurWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            // Suggested code may be subject to a license. Learn more: ~LicenseLog:2044533583.
            child: child),
      ),
    );
  }
}
