import 'dart:math';

class Prediction {
  final Random random = Random();
  final prediction = [
    'HAHA- Oh wait, you\'re serious.\nLet me laugh even harder\nHAHAHAHAHAHAHAHA.',
    'Sure, why not?',
    'I don\'t know, go ask someone else.',
    'Yeah, and I\'m never gonna die,\nHAHAH-Ah, I made myself sad.',
    'It could happen',
    'Bite my shiny, metal, daffodil.',
    'As they say, "Women are from Omicron Persei Seven, men are from Omicoron Persei Nine."-Wait, what?',
    'Sure thing, meat bag.'
  ];
  String currentMessage = 'Tap above to find out';
  void randomPrediction() {
    currentMessage = prediction[random.nextInt(prediction.length - 1)];
  }
}
