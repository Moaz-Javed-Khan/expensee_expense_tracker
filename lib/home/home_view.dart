import 'dart:math';

import 'package:expensee/widgets/dropdown_widget.dart';
import 'package:expensee/widgets/line_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double angle = pi * (3 / 4);
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility_outlined,
              color: Colors.grey,
            ),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.grey,
            ),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit_outlined,
              color: Colors.grey,
            ),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_alarm_rounded,
              color: Colors.grey,
            ),
            label: "hello",
          ),
        ],
      ),
      // floatingActionButton: ExpandableFab(
      //   children: [
      //     FloatingActionButton.small(
      //       heroTag: null,
      //       child: const Icon(Icons.edit),
      //       onPressed: () {},
      //     ),
      //     FloatingActionButton.small(
      //       heroTag: null,
      //       child: const Icon(Icons.search),
      //       onPressed: () {},
      //     ),
      //   ],
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
                    DropDownWidget(),
                    IconButton(
                      onPressed: () {},
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
                const Row(
                  children: [
                    Text(
                      "Recent Transaction",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
