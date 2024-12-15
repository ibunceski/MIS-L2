import 'package:flutter/material.dart';
import 'package:labs2/widgets/types_card.dart';

class TypesList extends StatelessWidget {
  final List<String>? types;

  const TypesList({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
          child: Column(
            children: [
              const Text(
                "Select type of joke",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 60,
                height: 2,
                color: Colors.teal,
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: types?.length ?? 0,
            itemBuilder: (context, index) {
              final type = types![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TypeCard(type: type),
              );
            },
          ),
        ),
      ],
    );
  }
}
