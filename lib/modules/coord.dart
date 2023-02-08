class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});
  factory Coord.fromJson(Map<String,dynamic> jsonData){
    var coord = Coord();

    coord.lon = jsonData['lon'];
    coord.lat = jsonData['lon'];
    return coord;
  }
}