class Main{
  double? temp;
  double? feels_like;
  int? pressure;
  int? humidity;

  Main({this.temp, this.feels_like, this.pressure, this.humidity});

  factory Main.fromJson(Map<String,dynamic> jsonData){

    var main = Main();
    main.temp = jsonData['temp'];
    main.feels_like = jsonData['feels_like'];
    main.pressure = jsonData['pressure'];
    main.humidity = jsonData['humidity'];

    //coord.lon = jsonData['lon'];

    return main;
  }
}