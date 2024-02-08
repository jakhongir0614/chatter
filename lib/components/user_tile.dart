import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
