import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/dashboard_tile.dart';

import 'features/qrcode.dart';
const Color instapayPurple = Colors.blueAccent;

// --- THE DASHBOARD (GRID) ---
class DashboardScreen extends StatelessWidget {
  const DashboardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Reusable Dashboard"))),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [

            // TILE 1: Navigates to a red page
            ReusableTile(
              title: "QR Code",
              icon: Icons.qr_code_2,
              color: Colors.blue,
              // default transition
              // onTap: () {
              //   //_navigateToPage(context, "Profile Page", Colors.blue);
              //
              //   // NEW: Navigate directly to your custom class
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const InstapayLearningPage(),
              //     ),
              //   );
              // },

             // Fade Transition
             //  onTap: () {
             //    Navigator.push(
             //      context,
             //      PageRouteBuilder(
             //        pageBuilder: (context, animation, secondaryAnimation) => const InstapayLearningPage(),
             //        transitionsBuilder: (context, animation, secondaryAnimation, child) {
             //          // We configure the FadeTransition here
             //          return FadeTransition(
             //            opacity: animation,
             //            child: child,
             //          );
             //        },
             //      ),
             //    );
             //  },


              // sliding UP
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const InstapayLearningPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Start from bottom (x=0, y=1) and go to center (x=0, y=0)
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },

              //Zooming animation

              // onTap: () {
              //   Navigator.push(
              //     context,
              //     PageRouteBuilder(
              //       // 1. Where are we going?
              //       pageBuilder: (context, animation, secondaryAnimation) => const InstapayLearningPage(),
              //       // 2. How long does it take? (Optional)
              //       transitionDuration: const Duration(milliseconds: 500),
              //       // 3. How does it look?
              //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
              //         return ScaleTransition(
              //           scale: animation,
              //           child: child,
              //         );
              //       },
              //     ),
              //   );
              // },

            ),

            // TILE 2: Navigates to a green page
            ReusableTile(
              title: "Settings",
              icon: Icons.settings,
              color: Colors.green,
              onTap: () {
                _navigateToPage(context, "Settings Page", Colors.green);
              },
            ),

            // TILE 3: Shows a SnackBar (Different logic!)
            ReusableTile(
              title: "Alert",
              icon: Icons.notifications,
              color: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You clicked the Alert tile!")),
                );
              },
            ),

            // TILE 4: Navigates to purple page
            ReusableTile(
              title: "Messages",
              icon: Icons.message,
              color: Colors.purple,
              onTap: () {
                _navigateToPage(context, "Messages", Colors.purple);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to handle navigation
  void _navigateToPage(BuildContext context, String title, Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlankPage(title: title, color: color),
      ),
    );
  }
}

// --- THE BLANK DESTINATION PAGE ---
class BlankPage extends StatelessWidget {
  final String title;
  final Color color;

  const BlankPage({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: color),
      body: Container(color: Colors.white),
    );
  }
}