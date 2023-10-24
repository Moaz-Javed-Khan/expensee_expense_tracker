import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expensee/Core/notification_services.dart';
import 'package:expensee/features/expense/expense_view.dart';
import 'package:expensee/features/home/home_view.dart';
import 'package:expensee/features/income/income_view.dart';
import 'package:expensee/features/profile/profile_view.dart';
import 'package:expensee/features/transfer/transfer_view.dart';
import 'package:expensee/widgets/expandable_fab.dart';
import 'package:flutter/material.dart';

class BottomNavigatgionBarWidget extends StatefulWidget {
  const BottomNavigatgionBarWidget({super.key});

  @override
  State<BottomNavigatgionBarWidget> createState() =>
      _BottomNavigatgionBarWidgetState();
}

class _BottomNavigatgionBarWidgetState
    extends State<BottomNavigatgionBarWidget> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    notificationServices.requestNotificationPermission();

    notificationServices.firebaseInit(context);

    notificationServices.setupInteractMessage(context);

    notificationServices.forgroundMessage();

    // notificationServices.isTokenRefreshed();

    notificationServices.getDeviceToken().then(
          (value) => print("Device Token: $value"),
        );
  }

  static const List<Widget> _screens = <Widget>[
    HomeView(),
    Text('Transactions'),
    Text('Pie Charts'),
    ProfileVIew(),
  ];

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  void _showAction(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExpenseView(),
        ),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const IncomeView(),
        ),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TransferView(),
        ),
      );
    }

    // showDialog<void>(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text(_actionTitles[index]),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: const Text('CLOSE'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  int _bottomNavIndex = 0;

  List<IconData> iconList = [
    Icons.home_rounded,
    Icons.compare_arrows_rounded,
    Icons.pie_chart_rounded,
    Icons.account_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        initialOpen: false,
        distance: 100,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_downward_rounded),
                Icon(Icons.wallet),
              ],
            ),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.circle_outlined),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 2),
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_upward_rounded),
                Icon(Icons.wallet),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.deepPurple[100]!,
        activeColor: Colors.deepPurpleAccent,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        elevation: 0, // main shadow
        onTap: (index) => setState(
          () => _bottomNavIndex = index,
        ),
        //other params
      ),
      body: Center(
        child: _screens.elementAt(_bottomNavIndex),
      ),
    );
  }
}
