import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
    required this.name,
    required this.imageUrl,
  });
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
          radius: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Hi, $name!',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
