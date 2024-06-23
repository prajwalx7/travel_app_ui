import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/Widgets/blur_widget.dart';
import 'package:myapp/Widgets/bottom_bar.dart';
import 'package:myapp/Data/travel_destination.dart';
import 'package:myapp/Widgets/destination_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _selectedIndex = 0;

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
    ))
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xffEBECF9),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discovery",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location5,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "You're in India",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/avatar.jpg"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Where do you want to go',
                    hintStyle: const TextStyle(color: Colors.black26),
                    prefixIcon: const Icon(
                      Iconsax.search_normal_1,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      "Vietnam",
                      "Japan",
                      "India",
                      "USA",
                      "Switzerland",
                      "Morocco",
                      "Canada",
                      "Italy",
                      "Finland",
                      "Norway",
                      "France",
                      "Canada"
                    ]
                        .map((city) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
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
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final destination = destinations[index];

                    return DestinationCard(destination: destination);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SlideTransition(
        position: _animation,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          height: 100,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlurWidget(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomBarItrem(
                      icon: Iconsax.home,
                      onTap: () {
                        if (_selectedIndex == 0) return;

                        Navigator.pushNamed(context, '/homescreen');
                      },
                      isSelected: _selectedIndex == 0,
                    ),
                    BottomBarItrem(
                      icon: Iconsax.heart,
                      onTap: () {
                        Navigator.pushNamed(context, '/favouritesscreen');
                      },
                      isSelected: _selectedIndex == 1,
                    ),
                    BottomBarItrem(
                      icon: Iconsax.ticket,
                      onTap: () {
                        Navigator.pushNamed(context, '/ticketsscreen');
                      },
                      isSelected: _selectedIndex == 2,
                    ),
                    BottomBarItrem(
                      icon: Iconsax.user,
                      onTap: () {
                        Navigator.pushNamed(context, '/userprofilescreen');
                      },
                      isSelected: _selectedIndex == 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
