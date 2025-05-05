import 'dart:math';

import 'package:flutter/material.dart';

class MyLessonScreen extends StatefulWidget {
  const MyLessonScreen({super.key});

  @override
  State<MyLessonScreen> createState() => _MyLessonScreenState();
}

class _MyLessonScreenState extends State<MyLessonScreen> {
  double progressValue = 0.65;
  final color = const Color(0xFF8A2BE2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.all(15.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF8A2BE2),
              child: Text('M', style: TextStyle(color: Colors.white)),
            ),
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _buildProgressCard(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  _buildCourseTile(Icons.play_arrow,Icons.lock_outlined, Icons.book, 'Interaction avec l\'IA',
                      'Introduction à l\'IA.', 'XP +10',
                      (){
                        // naviguer vers une page de cours
                      }),
                  _buildCourseTile(Icons.play_arrow, Icons.lock_outlined,Icons.book,
                      ' Programmation avec Python',
                      'Les bases de la programmation.', 'XP +10',
                      (){
                        // naviguer vers une page de cours
                      }
                      ),
                  _buildCourseTile(Icons.play_arrow, Icons.lock_outlined,Icons.book,
'Apprendre Figma',
                      'Les bases de Figma.', 'XP +5',(){
                        // naviguer vers une page de cours
                      }),
                  _buildCourseTile(Icons.play_arrow, Icons.lock_outlined,Icons.book,
 'Apprendre Flutter',
                      'Introduction à Flutter.', 'XP +15',
                      (){
                        // naviguer vers une page de cours
                      }),
                ],
              ),
            ),
          ),
        ])));
  }

  Widget _buildProgressCard() {
    return Card(
      color: color.withOpacity(0.12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ta progression',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatBox(Icons.favorite, '8'),
                _buildStatBox(Icons.auto_awesome_mosaic, '40'),
                _buildStatBox(Icons.fire_hydrant, '100'),
                _buildStatBox(Icons.auto_awesome, '+5'),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: progressValue,
                  minHeight: 20,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                const SizedBox(height: 8),
                Text('${(progressValue * 100).round()} % complété'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  // section liste des cours

Widget _buildCourseTile(IconData icon, IconData iconLesson,IconData iconSubTitle, String title, String subTitle, String xp, VoidCallback navigateTo) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF8A2BE2),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Text('leçon', style: TextStyle(
                    color: Colors.grey,
                   ),),
                   Icon(iconLesson, color: Colors.grey),
                   
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(iconSubTitle, color: color),
                    const SizedBox(width: 10,),
                    Text(subTitle, style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 1.2
                    ),),
                   
                  ],
                ),
              ),
              // xp
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        xp,
                        style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0
                          ),
                            ),
                            ),
                    onPressed: navigateTo, 
                    child: const Text('Apprendre',style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600
                    ),)
                    ),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 5),
      
    ],
  );
}
}
