
import 'package:toolkit_app/models/planet_model.dart';
import 'package:toolkit_app/mockups/planets_mock.dart';

class PlanetService{
  final _solarSystem = solarSystem;

  List<PlanetModel> get planets => _solarSystem;

  List<PlanetModel> planetsOrderByDistanceOfPlanet(PlanetModel planet){
    return planets.where((listPlanet) => listPlanet != planet).toList()
        ..sort((planetA, planetB){
          final distanceToA = distanceFromPlanets(planet, planetA);
          final distanceToB = distanceFromPlanets(planet, planetB);
          return distanceToA?.compareTo(distanceToB);
        });
  }

  double distanceFromPlanets(PlanetModel planetA, PlanetModel planetB){
    return (planetA.distanceFromTheSun - planetB.distanceFromTheSun )?.abs();
  }
}