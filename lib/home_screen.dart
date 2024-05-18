import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEBECF9),
        body: SafeArea(
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
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              city,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )))
                        .toList(),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                      image: const  DecorationImage(
                          image: AssetImage("assets/photo.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Row(children: [
                            ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                          
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20), 
                                child: Container(
                                 
                                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                  ),
                          // Suggested code may be subject to a license. Learn more: ~LicenseLog:2044533583.
                                   child: Text("\$400/ person",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            )
                          ],),
                        )
                      ],),
                )
              ],
            ),
          ),
        ));
  }
}
