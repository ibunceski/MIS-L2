import 'package:flutter/material.dart';
import 'package:labs2/screens/jokes_screen.dart';

class TypeCard extends StatelessWidget {
  final String type;

  const TypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Jokes(type: type),
            ),
          );
        },
        child: Container(
          color: Colors.lightGreen[400],
          width: MediaQuery.of(context).size.width * 0.8,
          height: 150,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
