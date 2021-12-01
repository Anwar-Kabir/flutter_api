import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/services/postmodelpost.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Postmodelpost> postList = [];

  Future<List<Postmodelpost>> getpostapi () async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      postList.clear();
      for (Map i in data){
        postList.add(Postmodelpost.fromJson(i));
      }
      return postList;

    }else {
      return postList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),

      ),
      body: Column(
         children: [

           Expanded(
             child: FutureBuilder(
                 future: getpostapi(),
                 builder: (context, snapshot){
                   if(!snapshot.hasData){
                    return Text("Loading...wait");
                   }
                   else{
                     return ListView.builder(
                       itemCount: postList.length,
                         itemBuilder: (context, index){
                         print(index.toString());
                           return Card(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    Text("Title: ", style: TextStyle(fontSize: 15,
                                        fontWeight:FontWeight.bold ),),
                                    Text(postList[index].title.toString()),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Text("Description: ", style: TextStyle(fontSize: 15,
                                        fontWeight:FontWeight.bold ),),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(postList[index].title.toString()),
                                  ],
                               ),
                             ),
                           );
                         }

                     );
                   }
             }),
           )
         ],
      )
    );
  }
}
