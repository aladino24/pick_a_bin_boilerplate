import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final databaseRef = FirebaseDatabase.instance.ref().child('aktivitas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Aktivitas',
          style: TextStyle(color: Color(0xff00783E)),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 100,

      ),
      body: FirebaseAnimatedList(
        query: databaseRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 13),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Anda sudah mengambil sampah",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${snapshot.child('name').value.toString()}\nSurya Citra Residence G-21 Tropodo"),
                  trailing: Text(snapshot.child('time').value.toString(),
                    style: TextStyle(color: Colors.grey),),
                ),
              ],
          ),
          );
            },
      ),);
  }
}


// class ListItem extends StatelessWidget {


//   const ListItem({Key? key, required Text title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 13),
//       child: Column(
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               "Anda belum mengambil sampah",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text("Aradhana Luqman\nSurya Citra Residence G-21 Tropodo"),
//             trailing: Text("25/04/22",
//               style: TextStyle(color: Colors.grey),),
//           ),
//         ],
//       ),
//     );
//   }
// }