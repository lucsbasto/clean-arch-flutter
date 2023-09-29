import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  final VoidCallback onTap;

  const DragHandle({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
