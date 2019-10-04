import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/ui/fruit_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "Cotação MP Juazeiro",
    home: ListaPrecoPage(),
  ));

}



class ListaPrecoPage extends StatefulWidget {
  @override
  _ListaPrecoPageState createState() => _ListaPrecoPageState();
}

class _ListaPrecoPageState extends State<ListaPrecoPage> {

  String test = "jonas";
  String mango = "https://i.stack.imgur.com/Dw6f7.png";

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
        backgroundColor: Colors.limeAccent,
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index){

        var a = snapshot.data.length;
        return GestureDetector(
          child: ListTile(
            leading: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(snapshot.data[index]["image_url"]),
            ),
            title: Text(snapshot.data[index]["name"]),
            subtitle: RichText(
              text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' world!'),
              ],
              ),
            ),
            
          ),
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => FruitPage(snapshot.data[index]["price"], snapshot.data[index]["name"])),
            );
          },
        );
      },
    );
  }

}