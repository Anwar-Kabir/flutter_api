import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/services/user_model.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  _ExampleThreeState createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List <UserModel> userList = [];

  Future <List<UserModel>> getuserapi() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  var data = jsonDecode(response.body.toString());

  if(response.statusCode == 200){
  for (Map i in data){
    userList.add(UserModel.fromJson(i));
  }

    return userList;
  }
  else{
    return userList;
  }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Expanded(

           child: FutureBuilder(
               future: getuserapi(),
               builder: (context, AsyncSnapshot<List<UserModel>> snapshort){

                 if (!snapshort.hasData){
                   return Center(child: CircularProgressIndicator.adaptive());
                 }
                 else {
                   return ListView.builder(
                       itemCount: userList.length,
                       itemBuilder: (context, index){
                         return Card(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 ReuseRow(title: "Name", value: snapshort.data![index].name.toString()),
                                 ReuseRow(title: "username", value: snapshort.data![index].username.toString()),
                                 ReuseRow(title: "email", value: snapshort.data![index].email.toString()),
                                 ReuseRow(title: "address", value: snapshort.data![index].address!.geo!.lat.toString()),
                                 ReuseRow(title: "phone", value: snapshort.data![index].phone.toString()),
                                 ReuseRow(title: "Company Name", value: snapshort.data![index].company!.name.toString()),

                               ],
                             ),
                           ),
                         );
                       });
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
