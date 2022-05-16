import 'package:flutter/material.dart';
import 'package:flutter_application_1/demo.dart';
import 'package:flutter_application_1/loc.dart';
import 'package:flutter_application_1/servs/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    // ignore: prefer_typing_uninitialized_variables
    var email, password, token;
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            onChanged: (val) {
              email = val;
            },
          ),
          TextField(
            // obscureText: true,
            decoration: const InputDecoration(hintText: "Password"),
            onChanged: (val) {
              password = val;
            },
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
                  }
                });
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const loc()));

              },
              child: const Text("Authtt")),
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
                  }
                });
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const loc()));
              },
              child: const Text("Register"))
              
        ],
      ),
    );
  }
}



