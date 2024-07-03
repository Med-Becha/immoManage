import 'package:flutter/material.dart';

class ImmoItemTrait extends StatelessWidget {
  const ImmoItemTrait({
    super.key,
    required this.label,
    required this.localisation,
  });

  final String label;
  final String localisation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            localisation,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
