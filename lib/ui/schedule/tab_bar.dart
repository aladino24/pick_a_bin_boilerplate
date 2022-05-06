import 'package:boilerplate/models/UserJadwal.dart';
import 'package:boilerplate/ui/schedule/list_done.dart';
import 'package:boilerplate/ui/schedule/list_schedule.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
  var faker = new Faker();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void launchWhatsApp({required int phone}) async {
    String url() {
      return "https://wa.me/$phone";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Jadwal',
          style: TextStyle(color: Color(0xff00783E)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Akan dilakukan',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Selesai',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SchedulePage()
                  ),

                  // second tab bar view widget
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListDonePage()
                  ),
                ],
              ),
            ),
          ],
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
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;

  ListItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Surabaya, Jawa Timur, Indonesia"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ex.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}