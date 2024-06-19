import 'package:geolocator/geolocator.dart';
class Location{
  var long ;
  var lat ;
  Future<void> getcurrentlocation() async{
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition();
      long = position.longitude;
      lat = position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}