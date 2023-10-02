import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final Diseases plant;
  const Detail({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Diseases'),
        actions: [
          IconButton(
            icon: Icon(Icons.archive_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Berhasil Menambahkan Ke Favorit"),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(plant.imgUrls),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Diseases Name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.name,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Plant Name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.plantName,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ciri-ciri:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.nutshell[0],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Diseases ID:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.id,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sympton:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.symptom,
            ),
            FloatingActionButton(onPressed: () {
              launchUrl(Uri.parse(
                plant.imgUrls,
              ));
            })
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
