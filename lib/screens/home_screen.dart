import 'package:flutter/material.dart';
import 'package:khetali/screens/my_lessons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildProgressCard(),
            const SizedBox(height: 20),
            _buildGridSection(),
            const SizedBox(height: 20),
            _buildRecentSection(),
          ],
        ),
      ),
    );
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
            const Text('Ta progression', style: TextStyle(fontWeight: FontWeight.bold)),
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

  Widget _buildGridSection() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.2,
      children: [
        _buildGridItem(Icons.book, "Mes cours", Colors.grey, () {
         // Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursScreen()));
        }),
        _buildGridItem(Icons.assignment, "Mes exercices", Colors.grey, () {
          //Navigator.push(context, MaterialPageRoute(builder: (_) => const MesExercicesPage()));
        }),
        _buildGridItem(Icons.support_agent, "Assistant", Colors.grey, () {
         // Navigator.push(context, MaterialPageRoute(builder: (_) => const AssistantPage()));
        }),
        _buildGridItem(Icons.videogame_asset, "Jeux", Colors.grey, () {
         // Navigator.push(context, MaterialPageRoute(builder: (_) => const JeuxPage()));
        }),
      ],
    );
  }
// section grid  items
  Widget _buildGridItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFCCCCCC),
              child: Icon(icon, color: Colors.yellow),
            ),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
// section ajout récent
  Widget _buildRecentSection() {
    return Card(
      color: Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ajout récent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
                Text('Voir plus', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 10,
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.white),
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Aliou B'),
                  Text('Hier'),
                ],
              ),
              subtitle: Row(
                children: [
                  _buildBadge('Français', Colors.blue.shade100),
                  const SizedBox(width: 8),
                  _buildBadge('Exo', Colors.green.shade100),
                  const SizedBox(width: 10),
                  const Icon(Icons.calendar_today_outlined, size: 15, color: Colors.grey),
                  const SizedBox(width: 6),
                  const Text('30 min'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
// sous-section badge
  Widget _buildBadge(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
