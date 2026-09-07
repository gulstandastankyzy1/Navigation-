import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String? country;
  final String story;

  const InfoPage({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.country,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Information',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name', style: TextStyle(fontSize: 18)),

                  SizedBox(height: 10),

                  Text('Phone: $phone', style: TextStyle(fontSize: 18)),

                  SizedBox(height: 10),

                  Text('Email: $email', style: TextStyle(fontSize: 18)),

                  SizedBox(height: 10),

                  Text('Country: $country', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Life Story',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(story, style: TextStyle(fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }
}
