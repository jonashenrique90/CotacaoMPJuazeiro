import 'package:flutter/material.dart';

class AddPreco extends StatefulWidget {
  @override
  _AddPrecoState createState() => _AddPrecoState();
}

class _AddPrecoState extends State<AddPreco> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Preço"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Preço',
              labelStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
              prefix: Text("R\$", style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
              )),
            ),
            style: TextStyle(fontSize: 20.0, color: Colors.black87),
            keyboardType: TextInputType.number,
          ),
          ),
        const SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            color: Colors.redAccent,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Adicionar',
              style: TextStyle(fontSize: 20.0)
            ),
          ),
        ),
        ],
      ),
      ),
    );
  }
}