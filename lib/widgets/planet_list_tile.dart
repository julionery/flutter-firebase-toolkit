

import 'package:flutter/material.dart';
import 'package:toolkit_app/models/planet_model.dart';
import 'package:toolkit_app/widgets/app_circle_avatar.dart';

class PlanetListTile extends StatelessWidget{
  final PlanetModel planet;
  final Function onTap;
  final Widget subtitle;

  PlanetListTile({
    Key key,
    @required this.planet,
    this.onTap,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(planet.name),
        subtitle: subtitle,
        leading: AppCircleAvatar(
          urlImage: planet.imageUrl,
        ),
        onTap: onTap,
      ),
    );
  }
}