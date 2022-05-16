// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// final TextEditingController _googleStreetController = TextEditingController();
// final TextEditingController _googleCityController = TextEditingController();
// final FocusNode _googleStreetInputFocusNode = FocusNode();
// final FocusNode _googleCityInputFocusNode = FocusNode();

// /// Google Map controller
// Completer<GoogleMapController> _googleMapsController = Completer();

// /// initial camera position of the map - set to 5th avenue, NYC
//  const LatLng _center = const LatLng(40.75476210819693, -73.98163492275201);

// /// set of map markers that user inserted
// final Set<Marker> _markers = {};
// class location extends StatefulWidget {
//   const location({ Key? key }) : super(key: key);

//   @override
//   State<location> createState() => _locationState();
// }

// class _locationState extends State<location> {Future<void> _onMapCreated(GoogleMapController controller) async {
//   setState(() {
//     _googleMapsController.complete(controller);
//   });
//   if(_markers.isEmpty){
//     return;
//   }
//   var marker = _markers.first;
//   double lat = marker.position.latitude;
//   double long = marker.position.longitude;
//   var c = await _googleMapsController.future;
//   await c.moveCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
//   await c.showMarkerInfoWindow(marker.markerId);
//   setState(() {

//   });
// }
//   InputDecoration _getInputDecoration(String hint) {
//   return InputDecoration(
//     enabledBorder: _getOutlineInputBorder(),
//     focusedBorder: _getOutlineInputBorder(color: Colors.lightGreen.shade800),
//     hintText: hint,
//     suffixIcon: hint == 'City'
//       ? Icon(Icons.location_city_outlined)
//       : Icon(Icons.home_outlined),
//     contentPadding: EdgeInsets.fromLTRB(5.0 , 5.0 , 5.0 , 5.0),
//   );
// }

// OutlineInputBorder _getOutlineInputBorder({Color color = Colors.grey}) {
//   return OutlineInputBorder(
//     borderSide: BorderSide(
//       color: color,
//       width: 1.3,
//     ),
//     borderRadius: BorderRadius.all(Radius.circular(30)),
//   );
// }

// bool _isAddressEmpty(){
//   return _googleStreetController.text.isEmpty || _googleCityController.text.isEmpty;
// }

// ///removing focus from all text field's
// void _unfocusAll(){
//   _googleCityInputFocusNode.unfocus();
//   _googleStreetInputFocusNode.unfocus();
// }

// @override
// Widget build(BuildContext context) {
//   return Material(
//     child: Center(
//       child: IconButton(
//         iconSize: 27.0, ///<-- default is 24.0
//         icon: Icon(Icons.favorite),
//         onPressed: () {
//           showDialog(
//             context: context,
//             barrierDismissible: true,
//             builder: (context) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       FocusScope.of(context).unfocus();
//                     },
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       child: Material(
//                         child: Container(
//                           color: Colors.transparent,
//                           height: MediaQuery.of(context).size.height * 0.8,
//                           width: MediaQuery.of(context).size.width,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Flexible(
//                                 flex: 5,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     Flexible(
//                                       flex: 4,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 8.0,
//                                           right: 4.0,
//                                           top: 12.0,
//                                           bottom: 9.0,
//                                         ),
//                                         child: TextField(
//                                           controller: _googleStreetController,
//                                           decoration: _getInputDecoration('Street'),
//                                           style: GoogleFonts.lato(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16.0,
//                                           ),
//                                           focusNode: _googleStreetInputFocusNode,
//                                           autofocus: false,
//                                           textAlign: TextAlign.start,
//                                           textAlignVertical: TextAlignVertical.center,
//                                           keyboardType: TextInputType.streetAddress,
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9 .]'))
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 3,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 4.0,
//                                           right: 4.0,
//                                           top: 12.0,
//                                           bottom: 9.0,
//                                         ),
//                                         child: TextField(
//                                           controller: _googleCityController,
//                                           decoration: _getInputDecoration('City'),
//                                           style: GoogleFonts.lato(
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16.0,
//                                           ),
//                                           keyboardType: TextInputType.streetAddress,
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(RegExp('[a-z A-Z .]'))
//                                           ],
//                                           focusNode: _googleCityInputFocusNode,
//                                           autofocus: false,
//                                           textAlign: TextAlign.start,
//                                           textAlignVertical: TextAlignVertical.center,
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       flex: 1,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(bottom: 9.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: <Widget>[
//                                             Flexible(
//                                               flex: 2,
//                                               child: IconButton(
//                                                 icon: Icon(
//                                                   Icons.add_location_alt,
//                                                   color: Colors.deepOrange,
//                                                   size: 27.0,
//                                                 ),
//                                                 onPressed: () async {
//                                                   _unfocusAll();
//                                                   if(_isAddressEmpty()){
//                                                     Fluttertoast.showToast(
//                                                       msg: 'Please choose address'
//                                                     );
//                                                     return;
//                                                   }
//                                                   List<Address> locations = <Address>[];
//                                                   try{
//                                                     locations = await Geocoder.local.findAddressesFromQuery(
//                                                         _googleStreetController.text.trim() + ' ' + _googleCityController.text.trim()
//                                                     );
//                                                   } on PlatformException catch (_){
//                                                     Fluttertoast.showToast(
//                                                       msg: 'Invalid address'
//                                                     );
//                                                     return;
//                                                   }
//                                                   if(locations.isEmpty){
//                                                     Fluttertoast.showToast(
//                                                       msg: 'Invalid address'
//                                                     );
//                                                     return;
//                                                   }
//                                                   var first = locations.first;
//                                                   // print('${first.locality}');
//                                                   // print('${first.adminArea}');
//                                                   // print('${first.subLocality}');
//                                                   // print('${first.subAdminArea}');
//                                                   // print('${first.addressLine}');
//                                                   // print(' ${first.thoroughfare}');
//                                                   // print('${first.subThoroughfare}');
//                                                   var coordinates = LatLng(first.coordinates.latitude, first.coordinates.longitude);
//                                                   _markers.clear();
//                                                   setState(() {
//                                                     _markers.add(
//                                                       new Marker(
//                                                         markerId: MarkerId(coordinates.toString()),
//                                                         draggable: false,
//                                                         visible: true,
//                                                         position: coordinates,
//                                                         icon: BitmapDescriptor.defaultMarker,
//                                                         infoWindow: InfoWindow(
//                                                           // title: first.thoroughfare! + ' ' !.+ (first?.subThoroughfare ?? ''),
//                                                           snippet: first.locality + ', ' + first.adminArea + ', ' + first.countryName,
//                                                         )
//                                                       )
//                                                     );
//                                                   });
//                                                   var marker = _markers.first;
//                                                   print(marker.toString());
//                                                   print(marker.markerId);
//                                                   double lat = marker.position.latitude;
//                                                   double long = marker.position.longitude;
//                                                   var c = await _googleMapsController.future;
//                                                   await c.moveCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
//                                                   ///FIXME: throwing unsupported exception
//                                                   await c.showMarkerInfoWindow(marker.markerId);
//                                                   setState(() {});
//                                                 }
//                                               ),
//                                             ),
//                                             Flexible(
//                                               flex: 1,
//                                               child: Text('Add',
//                                                 style: GoogleFonts.lato(
//                                                   fontSize: MediaQuery.of(context).size.height * 0.0256 * (12/18) + 0.4,
//                                                   fontWeight: FontWeight.w600
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Flexible(
//                                 flex: 33,
//                                 child: GoogleMap(
//                                   markers: _markers,
//                                   onTap: (LatLng details){
//                                     _unfocusAll();
//                                   },
//                                   onMapCreated: (c) async {
//                                     await _onMapCreated(c);
//                                   },
//                                   initialCameraPosition: CameraPosition(
//                                     target: _center,
//                                     zoom: 15.0,
//                                   ),
//                                 ),
//                               ),
//                               Flexible(
//                                 flex: 4,
//                                 child: Center(
//                                   child: OutlineButton.icon(
//                                     onPressed: () {
//                                       if(_isAddressEmpty()){
//                                         Fluttertoast.showToast(
//                                           msg: 'Please choose address'
//                                         );
//                                         return;
//                                       }
//                                     },
//                                     icon: Icon(
//                                       Icons.map,
//                                       color: Colors.black,
//                                       size: MediaQuery.of(context).size.height * 0.0256 * 25/18,
//                                     ),
//                                     label: Text(
//                                       'Submit chosen location',
//                                       textAlign: TextAlign.center,
//                                       style: GoogleFonts.lato(
//                                         fontSize: MediaQuery.of(context).size.height * 0.0256 * 16/18,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                       width: 1.5,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }
//           );
//         }
//       )
//     )
//   );
// }


// @override
// void dispose() {
//   _googleCityInputFocusNode.dispose();
//   _googleStreetInputFocusNode.dispose();
//   _googleCityController.dispose();
//   _googleStreetController.dispose();
//   super.dispose();
// }
// }

// /// method that is called on map creation and takes a MapController as a parameter.


