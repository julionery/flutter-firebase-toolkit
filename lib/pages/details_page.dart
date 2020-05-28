
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget{
  final String msg;
  DetailsPage({
    Key key, @required this.msg
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Text(msg),
        ),
      ),
    );
  }
}