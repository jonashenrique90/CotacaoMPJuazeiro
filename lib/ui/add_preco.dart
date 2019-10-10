import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class AddPreco extends StatefulWidget {

  final String id;

  AddPreco(this.id);

  @override
  _AddPrecoState createState() => _AddPrecoState();
}

class _AddPrecoState extends State<AddPreco> {
  

  TextEditingController priceController = TextEditingController();

  Future _addPrice() async {
    
    var now = new DateTime.now();
    
    var a = widget.id;
    // QuerySnapshot qn = await firestore.collection("frutas").getDocuments();
    //QuerySnapshot qn = await firestore.collection("frutas").getDocuments();
    setState(() {
      Firestore.instance.collection("frutas").document(a).collection("price").document().setData({"date": now, "price": double.parse(priceController.text)});
      priceController.text = "";
    });
    
    // var a = await firestore.collection('price').where((qn.documents) => price['fruit_id'] == 1);
    //return qn.documents;
  }
 

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
          Text("Preço por Kilograma"),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TextField(
              controller: priceController,
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
          // Text(id),
        const SizedBox(height: 30),
        RaisedButton(
          onPressed: _addPrice,
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