import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatelessWidget {
   ExampleFour({Key? key}) : super(key: key);

  var data;
  Future <void> getUserApi () async{
    
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
    data = jsonDecode(response.body.toString());
    }
    else{

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          Expanded(
            child: FutureBuilder(
                future: getUserApi (),
                builder: (context, snapshot){

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("Loading");
                  }
                  else {
                    return //Text(data[0]["name"].toString());
                    ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                ReuseRow(title: "name",value: data[index]["name"].toString()),
                                ReuseRow(title: "Username",value: data[index]["username"].toString()),
                                ReuseRow(title: "Address street",value: data[index]["address"]["street"].toString()),
                                ReuseRow(title: "Address lat",value: data[index]["address"]["geo"]["lat"].toString()),
                              ],
                            ),
                          );

                    }

                    );
                  }



            }),
          )

        ],
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
  String title, value;
  ReuseRow ({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

