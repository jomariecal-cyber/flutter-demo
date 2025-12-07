// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // // Entry point - make sure this exists (avoids "no main" error)
// // void main() {
// //   runApp(const MyApi());
// // }
//
// // 1. App root - uses HomeScreen as the home
// class MyApi extends StatelessWidget {
//   const MyApi({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'User Fetcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // if you want Poppins, ensure you added fonts in pubspec.yaml
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
//
// // 2. HomeScreen (Stateful because data changes)
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// // 3. State class: holds data and UI
// class _HomeScreenState extends State<HomeScreen> {
//   List<dynamic> users = [];      // 7: our "cart" of users
//   bool _isLoading = false;       // show spinner while fetching
//   String? _error;                // store error message (if any)
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Random Users'),
//         backgroundColor: Colors.blue,
//       ),
//
//       // 9. Body: show loading, error, or list
//       body: Builder(
//         builder: (context) {
//           if (_isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (_error != null) {
//             return Center(child: Text('Error: $_error'));
//           }
//           if (users.isEmpty) {
//             return const Center(child: Text('No users yet. Tap + to fetch.'));
//           }
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final user = users[index];
//               final name = (user['name']?['first'] ?? 'No name');
//               final email = (user['email'] ?? 'No email');
//               final imageUrl = (user['picture']?['thumbnail'] ?? '');
//
//               return ListTile(
//                 leading: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: imageUrl.isNotEmpty
//                       ? CircleAvatar(
//                           radius: 24,
//                           backgroundImage: NetworkImage(imageUrl),
//                           backgroundColor: Colors.grey[200],
//                         )
//                       : CircleAvatar(
//                           radius: 24,
//                           child: Text(name.isNotEmpty ? name[0] : '?'),
//                         ),
//                 ),
//                 title: Text(name),
//                 subtitle: Text(email),
//               );
//             },
//           );
//         },
//       ),
//
//       // 3. Floating button to fetch users
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         shape: const CircleBorder(),
//         onPressed: fetchUsers,
//         child: const Icon(Icons.download),
//       ),
//     );
//   }
//
//   // 4. Fetch users from randomuser.me
//   Future<void> fetchUsers() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });
//
//     const url = 'https://randomuser.me/api/?results=20';
//     try {
//       final uri = Uri.parse(url);               // 6: build URI
//       final response = await http.get(uri);     // network call
//
//       if (response.statusCode == 200) {
//         final body = response.body;
//         final jsonMap = jsonDecode(body);
//         // 8: pull the "results" key which contains the list
//         final results = jsonMap['results'] as List<dynamic>?;
//
//         if (results != null) {
//           setState(() {
//             users = results;
//             _isLoading = false;
//           });
//           // 9: debug log
//           debugPrint('fetchUsers completed: ${users.length} users loaded');
//         } else {
//           throw Exception('Unexpected JSON structure: no "results" key');
//         }
//       } else {
//         throw Exception('HTTP ${response.statusCode} - ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _error = e.toString();
//       });
//       debugPrint('fetchUsers failed: $e');
//     }
//   }
// }
