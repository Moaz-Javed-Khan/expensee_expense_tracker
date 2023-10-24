import 'package:expensee/features/notification/notification_view.dart';
import 'package:expensee/widgets/months_dropdown_widget.dart';
import 'package:expensee/widgets/line_chart_view.dart';
import 'package:expensee/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // double angle = pi * (3 / 4);
  // double turns = 0;

  // late final TabController _tabController;

  // int _bottomNavIndex = 0;

  List<IconData> iconList = [
    Icons.home_rounded,
    Icons.compare_arrows_rounded,
    Icons.pie_chart_rounded,
    Icons.account_circle,
  ];

  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 3, vsync: this);
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FloatingActionButton(
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   elevation: 0,
      //   backgroundColor: Colors.deepPurpleAccent,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 36,
      //   ),
      // ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const MonthsDropDownWidget(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationView(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                const Text("Account Balance"),
                const Text(
                  "\$5099",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        color: Colors.green,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.wallet,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "\$500",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.wallet,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expenses",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "\$200",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Spend Frequency",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const LineChartSample2(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[50],
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.amber[50],
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Week",
                        style: TextStyle(
                          // color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.amber[50],
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Month",
                        style: TextStyle(
                          // color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.amber[50],
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Year",
                        style: TextStyle(
                          // color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Transaction",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                // TransactionItemWidget(
                //   image: "assets/googleIcon.png",
                //   title: "Shopping",
                //   subtitle: "Buy some grocery",
                //   price: "-\$120",
                //   time: "10:00",
                // ),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // primary: false,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const TransactionItemWidget(
                      image: "assets/googleIcon.png",
                      title: "Shopping",
                      subtitle: "Buy some grocery",
                      price: "-\$120",
                      time: "10:00",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
