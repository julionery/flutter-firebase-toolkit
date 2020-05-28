import 'package:flutter/material.dart';
import 'package:toolkit_app/configs/strings_value.dart';

class CalculateImcPage extends StatefulWidget {
  final Widget _customDrawer;
  CalculateImcPage(this._customDrawer);

  @override
  _CalculateImcPageState createState() => _CalculateImcPageState();
}

class _CalculateImcPageState extends State<CalculateImcPage> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoTxt = StringValues.imcInfoTxtResult;

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoTxt = StringValues.imcInfoTxtResult;
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoTxt = "Abaixo do Peso (IMC - ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoTxt = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoTxt = "Levemente Acima do Peso (IMC - ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoTxt = "Obesidade Grau I (IMC - ${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoTxt = "Obesidade Grau II (IMC - ${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        _infoTxt = "Obesidade Grau III (IMC - ${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringValues.homeIMC),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        drawer: widget._customDrawer,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "O IMC (Índice de Massa Corporal) é uma ferramenta usada para detectar casos de obesidade ou desnutrição, principalmente em estudos que envolvem grandes populações. De acordo com o endocrinologista Mario Kedhi Carra, membro da Associação Brasileira para o Estudo da Obesidade e da Síndrome Metabólica (ABESO), essa é uma medida universal de classificação de obesidade, validada pela Organização Mundial da Saúde.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: StringValues.imcLabelWeight,
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      controller: weightController,
                      onEditingComplete: () {

                      },
                      validator: (value) {
                        if(value.isEmpty){
                          return "Insira seu Peso!";
                        }
                      },
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: StringValues.imcLabelHeight,
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      controller: heightController,
                      validator: (value) {
                        if(value.isEmpty){
                          return "Insira sua Altura!";
                        }
                      },
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: () {
                              if(_formKey.currentState.validate())
                                _calculate();
                            },
                            child: Text(
                              StringValues.imcBtnCalculate,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            color: Colors.green),
                      ),
                    ),
                    Text(
                      _infoTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                    )
                  ],
                ))));
  }
}
