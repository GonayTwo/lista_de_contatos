
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lista_de_contatos/helpers/contact_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
    helper.getAllContacts().then((list){
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: contacts.length,
          itemBuilder: (context, index){
            return _contactCard(context, index);
          }
      ),
    );
  }
  Widget _contactCard(Build context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img != null ?
                    FileImage(File(contacts[index].img)) :
                    AssetImage("images/avatar1.png")
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contacts[index].name ?? "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    ),
                    Text(contacts[index].email ?? "",
                    style: TextStyle(fontSize: 18),
                    ),
                    Text(contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
