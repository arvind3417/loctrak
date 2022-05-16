
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/register.dart';

class welcome extends StatelessWidget {
  
  
  const welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("LocTraK",
        style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome",
            style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20
            ),),
          ),
        ElevatedButton(onPressed: (){
          Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const login()));
        }, child: Text("Login"),style:  ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),) ),
              ElevatedButton(onPressed: (){
          Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const register()));
        }, child: Text("Register"),style:  ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),) )
        ],
      ),
      
      floatingActionButton: IconButton(onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const register()));}, icon: Icon(Icons.arrow_right,size: 60,)),
      
    );
  }
}