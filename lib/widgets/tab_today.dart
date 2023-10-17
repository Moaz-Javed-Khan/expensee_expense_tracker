import 'package:expensee/widgets/transaction_item_widget.dart';
import 'package:flutter/material.dart';

class TabToday extends StatefulWidget {
  const TabToday({super.key});

  @override
  State<TabToday> createState() => _TabTodayState();
}

class _TabTodayState extends State<TabToday> {
  @override
  Widget build(BuildContext context) {
    return TransactionItemWidget(
      image: "assets/googleIcon.png",
      title: "Shopping",
      subtitle: "Buy some grocery",
      price: "-\$120",
      time: "10:00",
    );
    // TransactionItemWidget(
    //   image: "assets/googleIcon.png",
    //   title: "Shopping",
    //   subtitle: "Buy some grocery",
    //   price: "-\$120",
    //   time: "10:00",
    // ),
    // ListView.builder(
    //   itemCount: 3,
    //   itemBuilder: (context, index) {
    //     return TransactionItemWidget(
    //       image: "assets/googleIcon.png",
    //       title: "Shopping",
    //       subtitle: "Buy some grocery",
    //       price: "-\$120",
    //       time: "10:00",
    //     );
    //   },
    // ),
  }
}


// tab on main

//               SizedBox(
//                 height: 50,
//                 child: AppBar(
//                   bottom: TabBar(
//                     controller: _tabController,
//                     tabs: const <Widget>[
//                       Tab(
//                         icon: Icon(Icons.cloud_outlined),
//                       ),
//                       Tab(
//                         icon: Icon(Icons.beach_access_sharp),
//                       ),
//                       Tab(
//                         icon: Icon(Icons.brightness_5_sharp),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: const <Widget>[
//                     Center(
//                       child: Text("It's cloudy here"),
//                     ),
//                     Center(
//                       child: Text("It's rainy here"),
//                     ),
//                     Center(
//                       child: Text("It's sunny here"),
//                     ),
//                   ],
//                 ),
//               ),