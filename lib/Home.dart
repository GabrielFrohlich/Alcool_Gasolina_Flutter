import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  String _textoResultado = "";

  ///
  ///
  ///
  void _calcular() {
    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      print('preço nulo');
      setState(() {
        _textoResultado = "Verifique os valores";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Abasteça com Álcool";
        });

        _limparCampos();
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });

        _limparCampos();
      }
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Álcool ou gasolina?")),
        body: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Image.asset('assets/images/logo.png')),
                    Text(
                        "Saiba qual a melhor opção para abastecimento do seu carro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Preço do Álcool, ex.: 1.59"),
                        controller: _controllerAlcool),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Preço da Gasolina, ex.: 3.21"),
                        controller: _controllerGasolina),
                    ElevatedButton(
                      onPressed: _calcular,
                      child: Text("Calcular"),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(_textoResultado,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)))
                  ],
                ))));
  }
}
