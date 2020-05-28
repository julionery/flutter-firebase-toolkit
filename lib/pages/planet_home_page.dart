
import 'package:flutter/material.dart';
import 'package:toolkit_app/pages/planet_detail_page.dart';
import 'package:toolkit_app/services/planet_service.dart';
import 'package:toolkit_app/widgets/planet_list_tile.dart';

class PlanetHomePage extends StatelessWidget {
  final String title;
  final PlanetService planetService = PlanetService();

  PlanetHomePage({
    Key key, this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: planetService.planets.map((planet){
            return PlanetListTile(
                planet: planet,
                subtitle: Text("${planet.distanceFromTheSun} AU do sol."),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlanetDetailPage(planet: planet),
                    ),
                  );
                },
            );
          }).toList(),
      );
  }
}
