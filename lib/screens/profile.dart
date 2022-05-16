import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  // const profile({Key? key}) : super(key: key);
  String? email, name;
  profile({required this.email, required this.name});

  @override
  State<profile> createState() => _profileState(email, name);
}

class _profileState extends State<profile> {
  String? email, name;
  _profileState(this.email, this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
            Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 3.1,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade800,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
              ),
            ),
          SizedBox(height: 10,),
        Text("${name}",style: TextStyle(fontSize: 26,fontFamily:"Schyler"),textAlign: TextAlign.center,),SizedBox(height: 10,),
        Text("$email",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
        // ElevatedButton(onPressed:(){} , 
        // child: Text("Edit"),)
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
              SizedBox(height: 16,),
          Text("I am very keen to learn new looking for an opportunity in which I can enhance my knowledge as well as give my best performance to myorganization. And am a fresher, but I assure you that I will make the best of it",style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      ]),
      // child: Text("${widget.email},${name}"),
    );
  }
}
