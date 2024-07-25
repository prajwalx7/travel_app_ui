import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/Data/travel_destination.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Screens/search_flights_screen.dart';
import 'package:myapp/Widgets/blur_widget.dart';
import 'package:myapp/Widgets/review_bar.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.destination});

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              destination.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 55.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: IconButton(
                    icon: const Icon(Iconsax.arrow_left),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: IconButton(
                    icon: const Icon(Iconsax.notification),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.18,
            minChildSize: 0.15,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return BlurWidget(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Row(
                          children: [
                            Text(
                              destination.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              destination.price,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 24.sp),
                            SizedBox(width: 4.w),
                            Text(
                              destination.rating,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              destination.location,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          destination.description,
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        SizedBox(height: 24.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReviewBar(),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(
                                    () => const SearchFlightsScreen(),
                                    transition: Transition.downToUp,
                                    duration: const Duration(milliseconds: 700),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  minimumSize: Size(70.w, 50.h),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  'Search Flights',
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Consumer<FavoritesProvider>(
                              builder: (context, favoritesProvider, child) {
                                final isFavorite =
                                    favoritesProvider.isFavorite(destination);
                                return GestureDetector(
                                  onTap: () {
                                    if (isFavorite) {
                                      favoritesProvider
                                          .removeFavorite(destination);
                                    } else {
                                      favoritesProvider
                                          .addFavorite(destination);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        if (isFavorite) {
                                          favoritesProvider
                                              .removeFavorite(destination);
                                        } else {
                                          favoritesProvider
                                              .addFavorite(destination);
                                        }
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Iconsax.heart5
                                            : Iconsax.heart,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
