import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toolkit_app/configs/strings_value.dart';
import 'package:http/http.dart' as http;

const request =
    "https://api.hgbrasil.com/finance/quotations?format=json&key=9a8300fd";

Future<Map> getQuote() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class CurrencyConverterPage extends StatefulWidget {
  final Widget _customDrawer;
  CurrencyConverterPage(this._customDrawer);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringValues.homeCurrencyConverter),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _clearAll,
            )
          ],
        ),
        drawer: widget._customDrawer,
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: getQuote(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Text(
                      "Carregando dados...",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Erro ao carregar os dados!",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      ),
                    );
                  } else {
                    dolar =
                        snapshot.data["results"]["currencies"]["USD"]["buy"];
                    euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(Icons.monetization_on,
                              size: 150.0, color: Colors.amber),
                          Divider(),
                          buildTextField("Reais", "R\$", "BRL", realController,
                              _realChanged),
                          Divider(),
                          buildTextField("Dólares", "US\$", "USD",
                              dolarController, _dolarChanged),
                          Divider(),
                          buildTextField(
                              "Euros", "€", "EUR", euroController, _euroChanged)
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}

Widget buildTextField(String label, String prefix, String money,
    TextEditingController c, Function f) {
  return Theme(
      data: new ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
      ),
      child: TextField(
        controller: c,
        onChanged: f,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.amber),
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.amber)),
            prefixText: prefix,
            suffixText: money,
            suffixStyle: const TextStyle(color: Colors.amber, fontSize: 25.0)),
        style: TextStyle(color: Colors.amber, fontSize: 25.0),
      ));
}
