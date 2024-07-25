import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  DateTime? _departureDate;
  DateTime? _returnDate;
  int _adults = 2;
  int _children = 0;
  String _selectedClass = 'Economy';

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null &&
        picked != (isDeparture ? _departureDate : _returnDate)) {
      setState(() {
        if (isDeparture) {
          _departureDate = picked;
        } else {
          _returnDate = picked;
        }
      });
    }
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Text(
                "Yay! Tickets Confirmed.",
                style: TextStyle(color: Colors.green),
              ),
              Lottie.asset(
                "assets/animations/ticket.json",
                height: 150.h,
              ),
              SizedBox(height: 16.h),
              Text(
                "You can check your ticket in the tickets section",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(
                    '/ticketsscreen',
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Go to Tickets"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book your ticket"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h),
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "From",
                      labelStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.flight_takeoff),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "To",
                      labelStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.flight_land),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Departure Date",
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.date_range),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          onTap: () => _selectDate(context, true),
                          controller: TextEditingController(
                            text: _departureDate != null
                                ? "${_departureDate!.toLocal()}".split(' ')[0]
                                : '',
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Return Date",
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.date_range),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          onTap: () => _selectDate(context, false),
                          controller: TextEditingController(
                            text: _returnDate != null
                                ? "${_returnDate!.toLocal()}".split(' ')[0]
                                : '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedClass,
                    items: ['Economy', 'Business', 'First Class']
                        .map((classType) => DropdownMenuItem<String>(
                              value: classType,
                              child: Text(classType),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedClass = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Class',
                      labelStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.class_),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Travellers",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCounterButton(
                        icon: Icons.remove,
                        onPressed: () {
                          setState(() {
                            if (_adults > 1) _adults--;
                          });
                        },
                      ),
                      Text(
                        '$_adults Adults',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      _buildCounterButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            _adults++;
                          });
                        },
                      ),
                      SizedBox(width: 2.w),
                      _buildCounterButton(
                        icon: Icons.remove,
                        onPressed: () {
                          setState(() {
                            if (_children > 0) _children--;
                          });
                        },
                      ),
                      Text(
                        '$_children Child',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: _children == 0 ? Colors.grey : Colors.black),
                      ),
                      _buildCounterButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            _children++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showBookingDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      minimumSize: Size(340.w, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: const Text("Book Now"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 170.h,
              width: double.infinity,
              child: Lottie.asset(
                "assets/animations/booking.json",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
          padding: EdgeInsets.all(0.r),
          constraints: const BoxConstraints(),
        ),
      ),
    );
  }
}
