import 'package:expensee/features/auth/signin/Presentation/bloc/login_bloc.dart';
import 'package:expensee/features/auth/signin/Presentation/screens/signin_view.dart';
import 'package:expensee/features/exportData/presentation/export_data.dart';
import 'package:expensee/widgets/settings_item_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileVIew extends StatefulWidget {
  const ProfileVIew({super.key});

  @override
  State<ProfileVIew> createState() => _ProfileVIewState();
}

class _ProfileVIewState extends State<ProfileVIew> {
  User? currentUser = FirebaseAuth.instance.currentUser;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('User'),
                    Text(
                      currentUser!.email!,
                      style: const TextStyle(
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
            Card(
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      onTap: () {},
                      title: "Account",
                      icon: Icons.account_balance_wallet,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      onTap: () {},
                      title: "Settings",
                      icon: Icons.settings,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExportDataView(),
                          ),
                        );
                      },
                      title: "Export Data",
                      icon: Icons.send_to_mobile_rounded,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileItemWidget(
                      onTap: () async {
                        await FirebaseAuth.instance
                            .signOut()
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninView(
                                      loginBloc: LoginBloc(),
                                    ),
                                  ),
                                ));
                      },
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
