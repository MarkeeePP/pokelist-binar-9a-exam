// hashtag no ai broskii. eh serius
import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const StatBar({
    super.key, 
    required this.label, 
    required this.value, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label, 
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            value.toString().padLeft(3, '0'),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value / 160,
                backgroundColor: Colors.white.withOpacity(0.1),
                color: color,
                minHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}