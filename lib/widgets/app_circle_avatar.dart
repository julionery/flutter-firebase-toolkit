import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  final Widget child;
  final String urlImage;

  AppCircleAvatar({
    Key key,
    this.child,
    @required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      backgroundImage: NetworkImage(
        urlImage,
      ),
    );
  }
}