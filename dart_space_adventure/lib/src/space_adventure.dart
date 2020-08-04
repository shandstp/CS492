import 'dart:io';
import 'planet.dart';
import 'planetary_system.dart';
import 'package:dart_space_adventure/dart_space_adventure.dart';

class SpaceAdventure {

  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if(planetarySystem.hasPlanets) {
      travel(promptyn(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Hmm, there are no planets to explore');
    }
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!\n'
        'There are ${planetarySystem.numberOfPlanets} planets to explore.\n');
  }

  void printIntroduction(String name) {
    print(
        'Nicet meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travel(bool randomDestination) {
    var planet = Planet.nullPlanet();
    if (randomDestination) {
      planet = planetarySystem.randomPlanet();
    } else {
      while(planet.name == 'Null') {
        planet = planetarySystem.planetWithName(
          responseToPrompt('Name the planet you would like to visit.')
        );
      }
    }
    travelTo(planet);
  }

  bool promptyn(String prompt) {
    var answer = 'Invalid';
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      // 'Shall I randomly choose a planet for you to visit? (Y or N)'
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
        // travelTo(responseToPrompt('Name the planet you would like to visit.'));
      } else {
        print('Invalid choice. Please select \'N\' or \'Y\'');
      }
    }
    return false;
  }
}
