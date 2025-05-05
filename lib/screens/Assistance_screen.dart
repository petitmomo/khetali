import 'package:flutter/material.dart';

class AssistanceScreen extends StatelessWidget {
  const AssistanceScreen({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            color: Colors.grey[200],
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AssistantMessage(
                        name: "Assistant Khétali",
                        message:
                            "Bonjour Fanta! Comment puis-je t’aider avec tes leçons aujourd’hui ?",
                      ),
                      const SizedBox(height: 12),
                      const UserMessage(
                        name: "Anta",
                        message:
                            "Bonjour, je ne comprends pas comment multiplier des fractions.",
                      ),
                      const SizedBox(height: 12),
                      const AssistantMessage(
                        name: "Assistant Khétali",
                        message:
                            "Pour multiplier des fractions, c’est simple ! Tu multiplies les numérateurs entre eux puis les dénominateurs entre eux.\nExemple: ...\n\nVeux-tu essayer un exercice ?",
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Oui, essayons !"),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Plus d'exemples"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // bouton
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 6),
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Pose ta question",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff0f0f0),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const CircleAvatar(
                            backgroundColor: Color(0xfffacc15),
                            child: Icon(Icons.lightbulb, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AssistantMessage extends StatelessWidget {
  final String name;
  final String message;

  const AssistantMessage({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfffff9c4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: "$name\n",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            TextSpan(text: message),
          ],
        ),
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  final String name;
  final String message;

  const UserMessage({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xfff3e8ff),
          borderRadius: BorderRadius.circular(8),
        ),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "$name\n",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xffa259ff)),
              ),
              TextSpan(text: message),
            ],
          ),
        ),
      ),
    );
  }
}
