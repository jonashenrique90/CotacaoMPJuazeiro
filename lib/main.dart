import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/ui/fruit_page.dart';
import 'package:todo/ui/time_series.dart';

void main() {
  runApp(MaterialApp(
    title: "Cotação MP Juazeiro",
    home: ListaPrecoPage(),
    theme: ThemeData(
      hintColor: Colors.redAccent,
      primaryColor: Colors.redAccent,
    ),
  ));

}



class ListaPrecoPage extends StatefulWidget {
  @override
  _ListaPrecoPageState createState() => _ListaPrecoPageState();
}

class _ListaPrecoPageState extends State<ListaPrecoPage> {

  String test = "jonas";

  Future getFruits() async {

    var firestore = Firestore.instance;
    // QuerySnapshot qn = await firestore.collection("frutas").getDocuments();
    QuerySnapshot qn = await firestore.collection("frutas").getDocuments();
    // var a = await firestore.collection('price').where((qn.documents) => price['fruit_id'] == 1);
    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cotação Juazeiro"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: getFruits(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Carregando..."),
                  );
                } else {
                  return _createListPrice(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _createListPrice(BuildContext context, AsyncSnapshot snapshot){
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index){

        var a = snapshot.data.length;
        return _contactCard(context, snapshot, index);
        // return GestureDetector(
        //   child: ListTile(
        //     contentPadding: EdgeInsets.symmetric(),
        //     dense: true,
            
        //     title: Text(snapshot.data[index]["name"]),
        //     subtitle: RichText(
        //       text: TextSpan(
        //       text: 'Hello ',
        //       style: DefaultTextStyle.of(context).style,
        //       children: <TextSpan>[
        //         TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
        //         TextSpan(text: ' world!'),
        //       ],
        //       ),
        //     ),
            
        //   ),
        //   onTap: (){
        //     Navigator.push(context, 
        //     MaterialPageRoute(builder: (context) => FruitPage(snapshot.data[index]["price"], snapshot.data[index]["name"])),
        //     );
        //   },
        // );
      },
    );
  }

  Widget _contactCard(BuildContext context, AsyncSnapshot snapshot, int index){

    double c_width = MediaQuery.of(context).size.width*0.4;
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0) ,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: c_width,
                      child: Text(snapshot.data[index]["name"] ?? "", 
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, )
                        ),
                    ),
                    RichText(
                      text: TextSpan(
                      text: "",
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: snapshot.data[index]["type"], style: TextStyle(fontSize: 18.0)),
                        TextSpan(text: " ", style: TextStyle(fontSize: 16.0)),
                        TextSpan(text: snapshot.data[index]["unit"].toString(), style: TextStyle(fontSize: 18.0)),
                        TextSpan(text: " Kg", style: TextStyle(fontSize: 16.0)),
                      ],
                      ),
                      ),
                    // Text(snapshot.data[index]["unit"].toString() ?? "", 
                    // style: TextStyle(fontSize: 18.0),
                    // ),
                    // Text(snapshot.data[index]["type"] ?? "", 
                    // style: TextStyle(fontSize: 18.0),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0.0, 10.0, 0.0),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.center,
                  //  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                      Text("R\$ 200.00",
                       style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.arrow_upward, color: Colors.green,),
                        Text("0.12%", style: TextStyle(color: Colors.green) ),
                      ],

                    ),
                  ],
                ) ,
              ),
            ],
          ),
        ),
      ),
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => FruitPage(snapshot.data[index]["price"], snapshot.data[index]["name"], snapshot.data[index]["image_url"], snapshot.data[index]["unit"], snapshot.data[index]["type"])),
            );
          },
          // onLongPress: (){
          //   Navigator.push(context, 
          //   MaterialPageRoute(builder: (context) => SimpleTimeSeriesChart(l)) );
          // },
    );
  }

}