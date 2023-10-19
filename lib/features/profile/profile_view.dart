import 'package:expensee/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';

class ProfileVIew extends StatefulWidget {
  const ProfileVIew({super.key});

  @override
  State<ProfileVIew> createState() => _ProfileVIewState();
}

class _ProfileVIewState extends State<ProfileVIew> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          right: 20.0,
          left: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 36,
                  // foregroundImage: ,
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username'),
                    Text(
                      'Moaz Javed Khan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Card(
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      title: "Account",
                      icon: Icons.account_balance_wallet,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      title: "Settings",
                      icon: Icons.settings,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      title: "Export Data",
                      icon: Icons.send_to_mobile_rounded,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      title: "Logout",
                      icon: Icons.logout,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
