import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String _info = "inform your weight and height";

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _info = "inform your weight and height";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double bmi = weight / (height * height);

      if (bmi < 18.6) {
        _info = "under weight (${bmi.toStringAsPrecision(4)})";
      } else if (bmi > 18.6 && bmi < 24.9) {
        _info = "Normal weight (${bmi.toStringAsPrecision(4)})";
      } else {
        _info = "overweight (${bmi.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          child: Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.orange),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight (Kg)",
                    labelStyle: TextStyle(color: Colors.orange)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "enter your weight";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "height (Cm)",
                    labelStyle: TextStyle(color: Colors.orange)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "enter your height";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed:() => calculate(),
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.orange,
                  ),
                ),
              ),
              Text(
                '$_info',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
