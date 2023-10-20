import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(8.0),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.purple[50],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          icon,
          size: 28,
          color: Colors.deepPurpleAccent,
        ),
      ),
      title: Text(title),
    );
  }
}
