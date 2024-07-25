import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_flags/country_flags.dart';
import 'package:myapp/Screens/booking_screen.dart';

class SearchFlightsScreen extends StatelessWidget {
  const SearchFlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBECF9),
      appBar: AppBar(
        backgroundColor: const Color(0xffEBECF9),
        title: const Text(
          'Available Flights',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '01:45 PM',
              landingCountry: 'Vietnam',
              landingIATA: 'HUI',
              landingTime: '08:15 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
            ),
            SizedBox(height: 20.h),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '09:00 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'SGN',
              landingTime: '04:30 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
            ),
            SizedBox(height: 20.h),
            FlightContainer(
              departureCountry: 'India',
              departureIATA: 'BOM',
              departureTime: '11:30 AM',
              landingCountry: 'Vietnam',
              landingIATA: 'HAN',
              landingTime: '06:00 PM',
              onPressed: () {
                Get.to(
                  () => const BookingScreen(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1000),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FlightContainer extends StatelessWidget {
  final String departureCountry;
  final String departureIATA;
  final String departureTime;
  final String landingTime;
  final String landingCountry;
  final String landingIATA;
  final VoidCallback? onPressed;

  const FlightContainer({
    super.key,
    required this.departureCountry,
    required this.departureIATA,
    required this.departureTime,
    required this.landingCountry,
    required this.landingIATA,
    required this.landingTime,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side - Departure
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryFlag.fromCountryCode(
                          height: 20.h,
                          width: 30.w,
                          'IN',
                          shape: RoundedRectangle(3.r),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          departureCountry,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      departureIATA,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      departureTime,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              // Arrow Icon
              Icon(Icons.arrow_right_alt, size: 40.sp),
              // Right Side - Landing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryFlag.fromCountryCode(
                          height: 20.h,
                          width: 30.w,
                          'VN',
                          shape: RoundedRectangle(3.r),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          landingCountry,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      landingIATA,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      landingTime,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }
}
