import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.time,
  });

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red[100],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(image),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          Text(
            time,
            // ignoconst re: prefer_const_constructors
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
