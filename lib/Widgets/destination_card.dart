import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../Data/travel_destination.dart';
import '../Screens/home_detail_screen.dart';
import '../Screens/favourites_provider.dart';

class DestinationCard extends StatelessWidget {
  final TravelDestination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.isFavorite(destination);
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 8.h),
          margin: EdgeInsets.only(top: 16.h),
          height: 300.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(destination.imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                      child: Text(
                        destination.price,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isFavorite) {
                          favoritesProvider.removeFavorite(destination);
                        } else {
                          favoritesProvider.addFavorite(destination);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Icon(
                          isFavorite ? Iconsax.heart5 : Iconsax.heart,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 162.h),
                    height: 130.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 22.h, horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  destination.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  size: 18.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  destination.location,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.star1,
                                  size: 22.sp,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  destination.rating,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => HomeDetailPage(
                                          destination: destination),
                                      transition: Transition.zoom,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 8.h),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Explore",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(
                                          Iconsax.arrow_circle_right4,
                                          size: 20.sp,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
