import 'package:flutter/material.dart';
import 'dart:async';

class FruitPage extends StatelessWidget {

  final Map _fruitData;
  final String nameFruit;
  FruitPage(this._fruitData, this.nameFruit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(nameFruit),
          Text("data"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}