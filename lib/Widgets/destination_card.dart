import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../Data/travel_destination.dart';
import '../Screens/home_detail_screen.dart';
import '../Screens/favourites_provider.dart';

class DestinationCard extends StatefulWidget {
  final TravelDestination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.isFavorite(widget.destination);

        return GestureDetector(
          onTapDown: (_) {
            setState(() => _isPressed = true);
            _animationController.forward();
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
            _animationController.reverse();
          },
          onTapCancel: () {
            setState(() => _isPressed = false);
            _animationController.reverse();
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              height: 320.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        widget.destination.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Top Section - Price and Favorite
                    Positioned(
                      top: 12.h,
                      left: 12.w,
                      right: 12.w,
                      child: Row(
                        children: [
                          // Price Tag with Glassmorphism
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.attach_money,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                    Text(
                                      widget.destination.price,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          Shadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            offset: const Offset(0, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),

                          // Favorite Button with Glassmorphism
                          _buildFavoriteButton(isFavorite, favoritesProvider),
                        ],
                      ),
                    ),

                    // Bottom Section - Gradient Overlay with Info
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 160.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Title
                            Text(
                              widget.destination.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // SizedBox(height: 6.h),

                            // Location
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  size: 16.sp,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    widget.destination.location,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),

                            // Rating and Explore Button
                            Row(
                              children: [
                                // Rating
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: Colors.amber.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Iconsax.star1,
                                        size: 16.sp,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        widget.destination.rating,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),

                                // Explore Button
                                GestureDetector(
                                  onTap: () => Get.to(
                                    () => HomeDetailPage(
                                        destination: widget.destination),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 400),
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.all(8.r),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                          const Icon(Icons.arrow_forward_ios)),
                                ),
                              ],
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
      },
    );
  }

  Widget _buildFavoriteButton(bool isFavorite, FavoritesProvider provider) {
    return GestureDetector(
      onTap: () {
        if (isFavorite) {
          provider.removeFavorite(widget.destination);
        } else {
          provider.addFavorite(widget.destination);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: isFavorite
                  ? Colors.red.withOpacity(0.3)
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: isFavorite
                    ? Colors.red.withOpacity(0.5)
                    : Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Iconsax.heart5 : Iconsax.heart,
                key: ValueKey(isFavorite),
                color: isFavorite ? Colors.red : Colors.white,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
