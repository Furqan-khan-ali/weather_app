import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/main.dart';


class SearchScreen extends StatelessWidget{
  TextEditingController searchCity = TextEditingController();
  //String? searchCity = 'karachi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Weather App',style: TextStyle(color: Colors.black87),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/test.webp'),
              fit: BoxFit.cover
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              margin: EdgeInsets.only(top: 15,right: 10,left:10 ),
              decoration: BoxDecoration(color: Color(0xFFea80fc)
                  ,borderRadius: BorderRadius.all(Radius.circular(35)), border: Border.all(color: Colors.purpleAccent)
              ),
              padding: EdgeInsets.all(15),
              child:TextField(controller: searchCity,
                  style: TextStyle(fontSize: 15,color: Colors.black87),
                  decoration: InputDecoration(hintText: 'Enter the city',hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none )
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 25,left:40,right: 40),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.purpleAccent,//0xFFD500f9
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1,color: Color(0xFFD500f9))),

              child: GestureDetector(onTap: ()=>{


                  Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen(city: searchCity.text,)

                  )),


              },
                  child: Text('Get We@ther',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black87),)
              ),

            ),



          ],
        ),
      ),
    );
  }

}