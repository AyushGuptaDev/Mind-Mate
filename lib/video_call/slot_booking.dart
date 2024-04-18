
//
//  import 'package:flutter/material.dart';
//
//  class SlotBooking extends StatefulWidget {
//    const SlotBooking({Key? key}) : super(key: key);
//
//    @override
//    State<SlotBooking> createState() => _SlotBookingState();
//  }
//
//  class _SlotBookingState extends State<SlotBooking> {
//    List<String> slots = [
//      "9:00 AM - 10:00 AM",
//      "10:00 AM - 11:00 AM",
//      "11:00 AM - 12:00 PM",
//      "1:00 PM - 2:00 PM",
//      "2:00 PM - 3:00 PM",
//      "3:00 PM - 4:00 PM",
//    ];
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: const Text("Choose Your Slot"),
//        ),
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Text(
//                "Available Slots",
//                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//              ),
//              SizedBox(height: 20),
//              Expanded(
//                child: ListView.builder(
//                  itemCount: slots.length,
//                  itemBuilder: (context, index) {
//                    return ListTile(
//                      title: Text(slots[index]),
//                      onTap: () {
//                        // Handle slot booking
//                        showDialog(
//                          context: context,
//                          builder: (context) => AlertDialog(
//                            title: Text("Confirmation"),
//                            content: Text("You have booked ${slots[index]}"),
//                            actions: [
//                              TextButton(
//                                onPressed: () {
//                                  Navigator.of(context).pop();
//                                },
//                                child: Text("OK"),
//                              ),
//                            ],
//                          ),
//                        );
//                      },
//                    );
//                  },
//                ),
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//  }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlotBooking extends StatefulWidget {
  const SlotBooking({Key? key}) : super(key: key);

  @override
  State<SlotBooking> createState() => _SlotBookingState();
}

class _SlotBookingState extends State<SlotBooking> {
  late List<DateTime> dates;
  List<String> slots = [
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "1:00 PM - 2:00 PM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
  ];

  @override
  void initState() {
    super.initState();
    dates = _generateNextThreeDays();
  }

  List<DateTime> _generateNextThreeDays() {
    List<DateTime> nextThreeDays = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < 3; i++) {
      DateTime nextDay = today.add(Duration(days: i));
      // Filter out slots before the current time for the current day
      if (i == 0) {
        DateTime now = DateTime.now();
        nextDay = DateTime(today.year, today.month, today.day, now.hour, now.minute);
      }
      nextThreeDays.add(nextDay);
    }
    return nextThreeDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Slot"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Available Slots",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          DateFormat('EEEE, MMM d').format(dates[index]),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: slots.length,
                        itemBuilder: (context, slotIndex) {
                          return ListTile(
                            title: Text(slots[slotIndex]),
                            onTap: () {
                              // Handle slot booking
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Confirmation"),
                                  content: Text(
                                      "You have booked ${slots[slotIndex]} on ${DateFormat('EEEE, MMM d').format(dates[index])}"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


