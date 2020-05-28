
import 'package:flutter/material.dart';
import 'package:toolkit_app/models/planet_model.dart';
import 'package:toolkit_app/services/planet_service.dart';
import 'package:toolkit_app/widgets/planet_list_tile.dart';

class PlanetDetailPage extends StatelessWidget{
  final PlanetModel planet;
  final PlanetService planetService = PlanetService();

  PlanetDetailPage({
    Key key,  this.planet
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body: ListView(
        children: [
          Container(
            child: Image.network(planet.imageUrl),
          ),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(12.0),
              subtitle: Text(planet.desc),
            ),
          )
        ]..addAll(
          planetService.planetsOrderByDistanceOfPlanet(planet).map((orderedPlanet){
            return PlanetListTile(
              planet: orderedPlanet,
              subtitle: Text("${planetService.distanceFromPlanets(planet, orderedPlanet).toStringAsPrecision(2)} AU do ${planet.name}"),
            );
          })
        ),
      ),
    );
  }
}