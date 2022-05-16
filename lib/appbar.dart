import 'package:flutter/material.dart';


class appBa extends StatelessWidget {
  const appBa({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocTraK",
        style: TextStyle(color: Colors.white,backgroundColor: Colors.purple),),
      ),
      
    );
  }
}