import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/modules/wether_response.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      themeMode: ThemeMode.dark,
      home: SearchScreen() ,
    );
  }


}

class HomeScreen extends StatefulWidget{

  String? city;
  HomeScreen({this.city});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late String cityTwo;
  WeatherResponse? weaRes;
  bool isLoading = false;
  String? passedString;
  String temp = "° c";
  String humidity = "Humidity";


  @override
  void initState() {
    super.initState();
    passedString = widget.city;
    print(passedString);
    _getWeather();
  }


  _getWeather() async {

    setState(() {
      isLoading = true;
    });

    try {
      //value = textEditController.text;
      final url = ("https://api.openweathermap.org/data/2.5/weather?q=${passedString}%20&appid=0462e17c28b9d341df9e4dc0bfcdcdbd&units=metric");
      var uri = Uri.parse(url);
        //"https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=0462e17c28b9d341df9e4dc0bfcdcdbd&units=metric"

      var response = await http.get(uri);
      var responseSTR = response.body;
      var decodedJson = jsonDecode(responseSTR) as Map<String,dynamic>;
      setState(() {
        weaRes = WeatherResponse.fromJson(decodedJson);
      });
    } catch (e) {
      print(e);
      // setState(() {
      //   //this.response = null;
      // });

    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:
          //ListView.builder(
         Container(
           constraints: BoxConstraints.expand(),
           decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage('assets/test.webp'),
                 fit: BoxFit.cover
             ),
           ),
         child:
        //           itemCount: 2,
        //           itemBuilder: (_,index) => ListTile(
        //             title: Text(weaRes?.name ?? ""),
        //             subtitle: Text(weaRes?.coord?.lon?.toString() ?? ""),
        //           ))
           Column(
             //crossAxisAlignment: CrossAxisAlignment.stretch,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(
                 height: 55,
               ),
               Icon(FontAwesomeIcons.cloud, size:75, color: Colors.white,),
               SizedBox(height: 15,),
               Center(
                   child:
                  Text(weaRes?.name ?? "" , style: TextStyle(
                   fontSize: 25, color: Colors.white, ),)
              ),
               Center(child:
               Text('${weaRes?.main?.temp?.toString() ?? ""}$temp', style: TextStyle(
                   fontSize: 55, color: Colors.white, letterSpacing: -7),)
                 ,),
               //Text('$passedString${weaRes?.name}')

               Center(child:
               Text('$humidity \n      ${weaRes?.main?.humidity?.toString() ?? ""}', style: TextStyle(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.white, letterSpacing: -1),)
                 ,
               ),
               if(isLoading)
                 CircularProgressIndicator(color: Colors.pinkAccent),
            ],
          ),


        ),

      );
    }
  }
