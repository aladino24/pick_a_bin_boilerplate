import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListDonePage extends StatelessWidget {
  ListDonePage({Key? key}) : super(key: key);
  var faker = new Faker();

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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListItem(
              title: faker.person.name(),
            );
          },
          itemCount: 15,
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchWhatsApp(phone: 6289521441520 );
        },
        label: const Text('Confirm'),
        icon: const Icon(Icons.chat),
        backgroundColor: const Color(0xff00783E),
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