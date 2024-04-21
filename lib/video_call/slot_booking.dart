


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_mate_project/video_call/booking_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SlotBooking extends StatefulWidget {
  const SlotBooking({super.key});

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

  Future<void>onChoosingSlot(BuildContext context, DateTime slot_time)async{
    late User? _user;
    _user=FirebaseAuth.instance.currentUser;


    if (_user != null) {
      // Update user profile in Firestore
      await FirebaseFirestore.instance.collection('users').doc(_user.uid).set({
        'booked slot': slot_time
        // You can add more details here if needed
      }, SetOptions(merge: true));
    }

    Navigator.of(context).pop();


    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingInfoScreen()));
  }

  // Future<void> onChoosingSlot(BuildContext context, DateTime slotTime) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     // Get the user's document reference
  //     final userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  //
  //     // Add the new slot to the user's booked slots
  //     await userDocRef.collection('bookedSlots').add({
  //       'slotTime': slotTime,
  //     });
  //
  //     Navigator.of(context).pop();
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingInfoScreen()));
  //   }
  // }


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
            const Text(
              "Available Slots",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
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
                          style: const TextStyle(
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
                                      "Do you want to book a slot ${slots[slotIndex]} on ${DateFormat('EEEE, MMM d').format(dates[index])}"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Convert the slot string into a DateTime object
                                        DateTime slotTime = DateTime(
                                            dates[index].year,
                                            dates[index].month,
                                            dates[index].day,
                                            int.parse(slots[slotIndex].split(':')[0]), // Extract hour from slot string
                                        0,);
                                        onChoosingSlot(context, slotTime);
                                      },
                                      child: const Text("Continue"),
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


