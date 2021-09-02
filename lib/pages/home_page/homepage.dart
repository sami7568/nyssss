import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:project1/api/APIService.dart';




import 'package:project1/pages/home_page/category.dart';

class HomePage extends StatefulWidget {

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Discover", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text("find", style: TextStyle(color: Colors.grey),),
            SizedBox(height: 20,),
            Expanded(
                  flex: 2,
                  child:  FutureBuilder(
                  future: APIServices().fetchDatum(),
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
                                 // qType.setId(snapshot.data[index].id);
                               });
                                 print("questionType selected is");
                                
                                
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Category()));
                              },
                              child: Container(
                                height: 60,
                                width: 100,
                                child: Card(
                                  
                                  color: Colors.grey,
                                  
                                  
                                  child: Center(child: Text(snapshot.data[index].name)),
                                ),
                              ),
                            );
                          }
                           );
                      }
                    }
                ),
              
                ),
          ],

      ),),),
    );
  }
}


