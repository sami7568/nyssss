import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/model/question_model.dart';
import 'package:project1/pages/home_page/drawer.dart';
import 'package:project1/pages/home_page/questions.dart';
import 'package:project1/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String password;
  const HomePage({
    Key key,
     this.email,
     this.password,
  }) : super(key: key);

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// void locatePosition () async {
//   Position position =await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//   long = position.longitude;
//   lat = position.latitude;
//   print("Longitude and latitude");
//   print(long);
//   print(lat);
// }

// @override
// void initState() { 
//   locatePosition();
//   super.initState();
  
// }

  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MyDrawer(email: widget.email,),
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Image.asset(
                        "assets/nys-logo.jpeg",
                        height: 180,
                      ),
                      SizedBox(height: 30),
                Text( "Home",
                        style: TextStyle(
                            color: Color(0xff1330fa),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Expanded(
                      flex: 2,
                      child:  FutureBuilder(
                      future: APIServices().categories(),
                      builder: (
                        context, snapshot){
                          if(!snapshot.hasData){
                            return Center(child: CircularProgressIndicator());
                          }else{
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder:(context,index){
                                return GestureDetector(
                                  onTap: () async{
                                   setState(() {
                                     typeId = snapshot.data[index].id;
                                     
                                   });
                                     
                                    
                                    
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Questions(email: widget.email,password: widget.password,)));
                                  },
                                  
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20,),
                                      Container(
                                        height: 60,
                                        width: 280,
                                        child: Card(
                                          
                                          color: Colors.grey[300],
                                          
                                          
                                          child: Center(child: Text(snapshot.data[index].name)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                               );
                          }
                        }
                    ),
                  
                    ),
              ],

            ),
          ),),
        ],
      ),
    );
  }
}


