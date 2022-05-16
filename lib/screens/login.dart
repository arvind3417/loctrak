import 'package:flutter/material.dart';
import 'package:flutter_application_1/demo.dart';
import 'package:flutter_application_1/loc.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/servs/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // ignore: prefer_typing_uninitialized_variables
  var  password, token;
  late String email,name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "LocTraK",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              // obscureText: true,
              decoration: const InputDecoration(hintText: "Name"),
              onChanged: (text) {
                name = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Email"),
              onChanged: (text) {
                email = text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              // obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (text) {
                password = text;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authserv().login(email, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  Fluttertoast.showToast(
                      msg: "authed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16);
Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loc(email: email,name:name)));
                }
              });

              
            },
            child: const Text("Login"),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: 15, left: 20),
                child: InkWell(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Colors.purple,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const register()));
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account"),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const register()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      backgroundColor: Colors.purple),
                ),
              )
            ],
          )
          // Text("Forgot Password ?"),
          // Text("Don't Have An Account "),
          // ElevatedButton(onPressed: () {}, child: Text("Register"))
          //      ElevatedButton(
          // onPressed: () {
          //   authserv().register(email, password).then((val) {
          //     if (val.data['success']) {
          //       token = val.data['token'];
          //       Fluttertoast.showToast(
          //           msg: "registered",
          //           toastLength: Toast.LENGTH_SHORT,
          //           gravity: ToastGravity.BOTTOM,
          //           timeInSecForIosWeb: 1,
          //           backgroundColor: Colors.green,
          //           textColor: Colors.white,
          //           fontSize: 16);
          //     }
          //   });
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const loc()));
          // },
          // child: const Text("Register"))
        ],
      ),
    );
  }
}
