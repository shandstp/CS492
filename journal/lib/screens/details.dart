import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({this.title, this.body, this.rating, this.datetime});
  String title;
  String body;
  int rating;
  DateTime datetime;
  static const routeName = 'deatils';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed View'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(150.0),
            child: Column(
              children: [
                Text('Title: $title'),
                Text('Body: $body'),
                Text('Rating: $rating'),
                Text('Date: $datetime')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
