import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/screens/userloc.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:geolocator/geolocator.dart';

class loc extends StatefulWidget {
  // loc({Key? key, required this.email}) : super(key: key);

  String email,name;
  loc({required this.email,required this.name});
  // loc({this.email});
  @override
  State<loc> createState() => _locState(email,name);
}

class _locState extends State<loc> {
  String email,name;
  _locState(this.email,this.name);
  var locationMesg = "";
  void getCurrLoc() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    setState(() {
      locationMesg = "$position";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  child: Text("location"),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Location services"),
        ),
        drawer: Drawer(
          
            child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text(name), accountEmail: Text(email),decoration: BoxDecoration(
              color: Colors.purple
            ),),
            // DrawerHeader(
            //   child: Text("drawer header"),
            //   decoration: BoxDecoration(color: Colors.blueGrey),
            // ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text(email),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.man),
              onTap: (){Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => profile(name:name,email:email)));},
              title: Text("Profile"),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => profile(name:name,email:email)));
                },
              ),
            ),

            // ListTile(leading: Icon(Icons.login),title: Text("Add Markers"),onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));},),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => welcome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Address"),
              onTap: () {
                
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => user(name:name,email:email)));
              },
            )
          ],
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(email),
              Icon(
                Icons.location_on,
                size: 46,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Current Location",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "$locationMesg",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
primary: Colors.purple
                ),
                  onPressed: () {
                    getCurrLoc();
                  },
                  child: Text(
                    "Current Location",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
