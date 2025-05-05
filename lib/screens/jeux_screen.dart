import 'package:flutter/material.dart';

class JeuxScreen extends StatelessWidget {
  const JeuxScreen({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Card(
            color: Colors.grey[200],
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Étapes verrouillées et actives (en haut après l'avatar)
                  const Text("Étapes",
                      style: TextStyle(color: Color(0xFF8A2BE2), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          index == 0
                              ? Icons.book
                              : Icons.lock_outline,
                          color: index == 0 ? Colors.green : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
              
                  // Challenge instantané
                  const Text("Challenge instantané",
                      style: TextStyle(color: Color(0xFF8A2BE2), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("Démarrez un défi instantanément."),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        // Joueur 1
                        Expanded(
                          child: Container(
                            color: Colors.red.withOpacity(0.1),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF8A2BE2),
                                  child:
                                  Text("M", style: TextStyle(color: Colors.white)),
                                ),
                                SizedBox(height: 5),
                                Text("Vous"),
                              ],
                            ),
                          ),
                        ),
              
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("VS",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
              
                        // Joueur 2
                        Expanded(
                          child: Container(
                            color: Colors.blue.withOpacity(0.1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child:
                                  Icon(Icons.masks, color: Colors.white),
                                ),
                                const SizedBox(height: 5),
                                const Text("Joueur 2"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
              
                  // Parcours
                  const Text("Parcours",
                      style: TextStyle(color: Color(0xFF8A2BE2), fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("Continuez votre quête du savoir"),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
                    ),
                    child: CustomPaint(
                      painter: ParcoursPainter(),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ParcoursPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.7,
        size.width * 0.4, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.4,
        size.width * 0.7, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.85, size.height * 0.1,
        size.width * 0.9, size.height * 0.1);
    canvas.drawPath(path, paint);

    final points = [
      Offset(size.width * 0.1, size.height * 0.9),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.7, size.height * 0.3),
      Offset(size.width * 0.9, size.height * 0.1),
    ];

    final circlePaint = Paint()..color = Colors.pink.shade200;
    for (var point in points) {
      canvas.drawCircle(point, 20, circlePaint);

      final icon = Icons.menu_book;
      final textPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(icon.codePoint),
          style: TextStyle(
            fontSize: 20,
            fontFamily: icon.fontFamily,
            package: icon.fontPackage,
            color: Colors.white,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        point - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    final flagPaint = Paint()..color = Colors.blue;
    final flagPosition = points.last;
    final flagPath = Path()
      ..moveTo(flagPosition.dx, flagPosition.dy - 25)
      ..lineTo(flagPosition.dx, flagPosition.dy - 10)
      ..lineTo(flagPosition.dx + 10, flagPosition.dy - 17)
      ..close();
    canvas.drawPath(flagPath, flagPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
