import 'package:flutter/material.dart';
import 'package:todo/ui/add_preco.dart';



class FruitPage extends StatelessWidget {

  final Map _fruitData;
  final String nameFruit;
  final String image_fruit;
  final int unidade;
  final String type; 
  FruitPage(this._fruitData, this.nameFruit, this.image_fruit, this.unidade, this.type);

  @override
  Widget build(BuildContext context) {

    double c_width = MediaQuery.of(context).size.width*0.4;
    bool c = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                children: <Widget>[
                  Icon(c ? Icons.arrow_upward : Icons.arrow_downward, color: c ? Colors.green : Colors.red,),
                  Text("0.12%", style: TextStyle(color: Colors.green) ),
                ],
              ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child:  Container(
                  width: c_width,
                  child: Column(
                children: <Widget>[
                  Text(nameFruit,
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                  ),
                  Text("R\$ 200.00",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                children: <Widget>[
                  Text(type, style: TextStyle(color: Colors.black54)),
                  Row(
                    children: <Widget>[
                      Text(unidade.toString(), style: TextStyle(color: Colors.black54) ),
                      Text("Kg", style: TextStyle(color: Colors.black54)),
                    ],
                  ), 
                ],
              ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    Text("Valor Mínimo"),
                    Text("R\$200"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    Text("Valor Máximo"),
                    Text("R\$200"),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 20.0,
            indent: 10.0,
            endIndent: 10.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Sales for the  5 years", style: TextStyle(fontSize: 24.0,), ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPreco()),
              );
        },
        backgroundColor: Colors.redAccent,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}