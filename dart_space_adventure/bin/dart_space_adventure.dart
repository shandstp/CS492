import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

const systemName = 'Solar System';

void main(List<String> arguments) {
  var input = File('bin/planetarySystem.json').readAsStringSync();
  var parsed = jsonDecode(input);
  var planets = <Planet>[];
  parsed['planet'].forEach((planet) {
    planets.add(mockPlanets(planet));
  });
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: parsed['name'],
      planets: planets
    )
  ).start();
}

Planet mockPlanets(Map<String, dynamic> planet) {
  return Planet(planet);
}