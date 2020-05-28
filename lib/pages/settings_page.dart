
import 'package:flutter/material.dart';
import 'package:toolkit_app/configs/strings_value.dart';

class SettingsPage extends StatelessWidget {

  final Widget _customDrawer;

  SettingsPage(this._customDrawer);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(StringValues.homeSettings),
          centerTitle: true,
        ),
        drawer: _customDrawer,
        body: Center(
          child: Text("Olá Mundo"),
        ),
      );
  }
}
