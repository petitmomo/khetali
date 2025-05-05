import 'package:flutter/material.dart';
import 'package:khetali/screens/Assistance_screen.dart';
import 'package:khetali/screens/home_screen.dart';
import 'package:khetali/screens/jeux_screen.dart';
import 'package:khetali/screens/login_screen.dart';
import 'package:khetali/screens/my_lessons.dart';

import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khétali',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initial route
      initialRoute: '/main',
      // routes
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/assistance': (context) => const AssistanceScreen(),
        '/jeux': (context) => const JeuxScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
// Bouton de navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Méthode pour changer de page en fonction de l'index sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Liste des pages
   final List<Widget> _pages = [
     const HomeScreen(),
      const MyLessonScreen(),
      const JeuxScreen(),
      const AssistanceScreen(),
      const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF8A2BE2),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Apprendre',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: 'Jeux',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Assistance',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF000000),
          unselectedItemColor:const Color(0xFFFFFFFF) ,
          onTap: _onItemTapped,
        ),
      ],
    );
  }
}


