import 'package:flutter/material.dart';
import '../models/prediction.dart';

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  final prediction = Prediction();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .3,
      widthFactor: .6,
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                setState(() {
                  prediction.randomPrediction();
                });
              },
              child:
                  Text('Will they call me?', style: TextStyle(fontSize: 30))),
          Text('${prediction.currentMessage}')
        ],
      ),
    );
  }
}
