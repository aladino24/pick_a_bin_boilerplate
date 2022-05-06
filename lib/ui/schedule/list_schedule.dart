import 'package:boilerplate/models/UserJadwal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

 

  var timeController = DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now());


  final databaseRef = FirebaseDatabase.instance.reference();

  void insertTime(String time){
      databaseRef.child("aktivitas").push().set({
        'name': 'Aradhana Luqman',
        'time': time,
        'status': 'true'
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            final UserJadwal jadwal = userJadwalList[index];
            return InkWell(
              child: listItem(jadwal),
            );
          },
          itemCount: userJadwalList.length,
        ),
      ),
    );
  }

  Widget listItem(UserJadwal jadwal) {
    return Container(
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    jadwal.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    jadwal.location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(color: Colors.grey),
              activeColor: const Color(0xff00783E),
              checkColor: Colors.white,
              value: jadwal.value,
              onChanged: (newValue) {
                setState(() {
                  jadwal.value = newValue;
                 insertTime(timeController.toString());
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

 