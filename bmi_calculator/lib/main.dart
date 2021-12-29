import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  
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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Icon(Icons.person_outline, size: 120.0, color: Colors.orange),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Weight (Kg)",
                labelStyle: TextStyle(color: Colors.orange)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontSize: 25.0),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "height (Cm)",
                labelStyle: TextStyle(color: Colors.orange)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
