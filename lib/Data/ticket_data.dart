import 'package:flutter/material.dart';

class TicketData extends StatelessWidget {
  const TicketData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1.0, color: Colors.green),
                ),
                child: const Center(
                  child: Text(
                    'Business Class',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const Row(
                children: [
                  Text(
                    'BOM',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.flight_takeoff,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'BLR',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'Flight Ticket',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ticketDetailsWidget(
                    'Passengers', 'Prajwal Dudhatkar', 'Date', '22-08-2024'),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 52.0),
                  child:
                      ticketDetailsWidget('Flight', '76836A45', 'Gate', '66B'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 53.0),
                  child:
                      ticketDetailsWidget('Class', 'Business', 'Seat', '21B'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: Container(
              width: 250.0,
              height: 180.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/barcode.jpg'),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 100.0, right: 75.0),
            child: Text(
              '9230 2884 5163',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
