import 'dart:convert';
// 5 add the httpdart and import here
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:wallet_ui/pages/home_page.dart';

// 1 make a class
class MyApi extends  StatelessWidget {
  const MyApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}

// 2 home.dart (Screen)
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 7 make a list of users
  List<dynamic> users = [];


  @override
  Widget build(BuildContext context) {
   return  PopScope(
    canPop: false, // prevents automatic popping
    onPopInvoked: (didPop) {
      if (!didPop) {
        Navigator.pop(context); // manually go back
      }
    },
    child: Scaffold(
      appBar: AppBar(
        title: Text('data'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final name = user['name']['first'];
          final email = user['email'];
          final imageUrl = user['picture']['thumbnail'];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                child: Image.network(imageUrl),
              ),
            ),
            subtitle: Text(name),
            title: Text(email),
          );
        },
      ),

      // 3 under this make a button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        onPressed: fetchUsers,
        ),
    ),
    );
  }

  void fetchUsers() async{
  print('fetchUsers called!');
  // 6 need to pass the URI
  const url = 'https://randomuser.me/api/?results=20'; //API
  final uri = Uri.parse(url); //convert the uri to url
  final response = await http.get(uri); // getting the response
  final body = response.body; // the values is placed on body
  final json = jsonDecode(body); // the response.body or the body will be decoded
  // 8 need to mention the key
  setState((){
  users = json['results'];
  });

 // 9 add an indicator to see if it is sucess
print('fetchUsers completed');
}
}


