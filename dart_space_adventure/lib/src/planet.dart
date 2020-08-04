class Planet {
  String name;
  String description;

  Planet(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
  }
  Planet.nullPlanet() : name = 'Null', description = 'Null';
}