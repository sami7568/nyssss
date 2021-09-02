import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/APIService.dart';
import 'package:project1/pages/home_page/choice_page.dart';
import 'package:project1/widgets/widgets.dart';

import '../submit_page.dart';
import 'drawer.dart';

class Category1 extends StatefulWidget {
  @override
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1> {
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
                  
                  child:  FutureBuilder(
                  future: APIServices().monthCommSer(),
                  builder: (
                    context, snapshot){
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }else{
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder:(context,index){
                            return Column(
                              children: [
                                
        Text(snapshot.data[index].questionText, style: TextStyle(fontSize: 15)),
        Text(snapshot.data[index].questionType.toString(), style: TextStyle(fontSize: 15)),
        
        // FutureBuilder(
        //           future: APIServices().fetchDatum(),
        //           builder: (
        //             context, snapshot){
        //               if(!snapshot.hasData){
        //                 return Center(child: CircularProgressIndicator());
        //               }else{
        //                 return ListView.builder(
        //                   itemCount: snapshot.data.length,
        //                   itemBuilder:(context,index){
        //                     return Container(
        //                       height: 80,
        //                       width: 180,
        //                       child: Column(
        //                         children: [
                                  
        // Text(snapshot.data[index].questionText, style: TextStyle(fontSize: 15)),
        // // SizedBox(height: 20,),
        // // Text(snapshot.data[index].questionType, style: TextStyle(fontSize: 15)),
        
       
        //                         ],
        //                       ),
        //                     );
        //                   }
        //                    );
        //               }
        //             }
        //         ),
       
                              ],
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
