import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconButtonCustom({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}
