import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// void main() {
//   runApp(user());
// }

class user extends StatefulWidget {
  String email, name;
  user({required this.email, required this.name});
  @override
  _userState createState() => _userState(email, name);
}

class _userState extends State<user> {
  String? email, name;

  // _userState(String email, String name);
  // ignore: unused_element
  // _user(rethis.email,this.name);
  _userState(this.email, this.name);
  Position? _currentPosition;
  final geolocator =
      Geolocator.getCurrentPosition(forceAndroidLocationManager: true);

  String currentAddress = "";

  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];

      setState(() {
        currentAddress =
            "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Location"),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("$name"),
              accountEmail: Text("$email"),
              decoration: BoxDecoration(color: Colors.purple),
            ),
            // DrawerHeader(
            //   child: Text("drawer header"),
            //   decoration: BoxDecoration(color: Colors.blueGrey),
            // ),
            // ListTile(
            //   leading: Icon(Icons.mail),
            //   title: Text(email),
            //   trailing: IconButton(
            //     icon: Icon(Icons.edit),
            //     onPressed: () {},
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Icons.man),
            //   onTap: (){Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) => profile()));},
            //   title: Text("Profile"),
            //   trailing: IconButton(
            //     icon: Icon(Icons.edit),
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) => profile()));
            //     },
            //   ),
            // ),

            // ListTile(leading: Icon(Icons.login),title: Text("Add Markers"),onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));},),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => welcome()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.map),
            //   title: Text("Address"),
            //   onTap: () {

            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) => user()));
            //   },
            // )
          ],
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_currentPosition!.latitude"),
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: <Widget>[
                    Text("Plz wait It takes time to render your location"),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 46,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple),
                                child: Text(
                                  'Get Location',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: getCurrentLocation,
                              ),
                              if (_currentPosition != null &&
                                  currentAddress != null)
                                Text(currentAddress,
                                    style: TextStyle(fontSize: 20.0))
                              else
                                Text("Could'nt fetch the location"),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
