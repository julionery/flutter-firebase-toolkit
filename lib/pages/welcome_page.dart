import 'package:flutter/material.dart';
import 'package:toolkit_app/pages/details_page.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({
    Key key
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Loja de Veículos"),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            RaisedButton(
              child: Text("Planetário"),
              onPressed: () {
                Navigator.of(context).pushNamed('/homePlanet');
              },
            ),
            RaisedButton(
              child: Text("Ir para pagina CONFIGURAÇÕES"),
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            RaisedButton(
              child: Text("Ir para pagina DETALHES"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      msg: "Esta mensagem veio da pagina inicial",
                    )
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
