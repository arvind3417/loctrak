import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/demo.dart';
import 'package:flutter_application_1/loc.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/servs/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  // ignore: prefer_typing_uninitialized_variables
  var email, password, token;
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
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Email"),
              onChanged: (val) {
                email = val;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              // obscureText: true,
              
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (val) {
                password = val;
              },
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       authserv().login(email, password).then((val) {
          //         if (val.data['success']) {
          //           token = val.data['token'];
          //           Fluttertoast.showToast(
          //               msg: "authed",
          //               toastLength: Toast.LENGTH_SHORT,
          //               gravity: ToastGravity.BOTTOM,
          //               timeInSecForIosWeb: 1,
          //               backgroundColor: Colors.green,
          //               textColor: Colors.white,
          //               fontSize: 16);
          //         }
          //       });
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const loc()));

          //     },
          // child: const Text("Authtt")),
          ElevatedButton(
              onPressed: () {
                authserv().register(email, password).then((val) {
                  if (val.data['success']) {
                    token = val.data['token'];
                    Fluttertoast.showToast(
                        msg: "registered",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16);
                         Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const login()));
                  }
                });
               
              },
              child: const Text("Register",),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              
              ) )
        ],
      ),
    );
  }
}
