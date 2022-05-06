import 'package:boilerplate/ui/home/list_contact.dart';
import 'package:boilerplate/ui/schedule/list_schedule.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(color: Color(0xff00783E)),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: ListView(
          children: <Widget>[
            const Text(
              "Hi, Petugas!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/home.jpg",),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: const Text(
                  "Aktivitas",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SchedulePage()));
                      },
                      child: Container(
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.date_range_outlined,
                              size: 70,
                              color: Colors.green,
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.green, spreadRadius: 2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Jadwal \nPengambilan",
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListContactPage()));
                      },
                      child: Container(
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.contacts_outlined,
                              size: 70,
                              color: Colors.green,
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.green, spreadRadius: 2),
                          ],
                        ),

                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        child: const Text(
                          "Kontak",
                          textAlign: TextAlign.center,
                        ))
                  ],
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: const Text(
                  "Jadwal Terbaru",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Column(
              children: <Widget>[
                CheckboxListTile(
                  title: const Text(
                    "Fidisa Anindya",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Surabaya, Jawa Timur, Indonesia"),
                  secondary: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ex.jpg")
                  ),
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  selected: isChecked,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    title: const Text(
                      "Fidisa Anindya",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Surabaya, Jawa Timur, Indonesia"),
                    secondary: const CircleAvatar(
                      backgroundImage:AssetImage("assets/images/ex.jpg")
                    ),
                    autofocus: false,
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: isChecked,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}