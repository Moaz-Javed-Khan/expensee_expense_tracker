import 'dart:convert';

import 'package:expensee/Core/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationServices notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            print("button pressed");
            notificationServices.getDeviceToken().then((value) async {
              print("Token: $value");

              var data = {
                'to':
                    'cbM9tiVvRPuQGan5N0YjeW:APA91bHEcqAwo2LEEj_xjQnJdMbT_MR73Lw-j4AEyhW-Gc5zSCi5BAQoJIyRESxO-o2YAzu2sbBC1vpZ8CE1-q282wBiI6M-rXRvkMGS_Kk8wbfLbKxE9NvCiV0nlLOLDFnQxNn3uhe9', // value.toString(),
                'priority': 'high',
                'notification': {
                  'title': 'Moaz',
                  'body': 'notificationnnn',
                },
                'data': {
                  'type': 'msg',
                  'id': '12345678',
                },
              };

              print("Data: $data");

              var request = await http.post(
                  Uri.parse('https://fcm.googleapis.com/fcm/send'),
                  body: jsonEncode(data),
                  headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization':
                        'key=AAAAn6LSalY:APA91bEwGppzTlqaNChwcr3YtFlzJAaAgj46QJsHL9V6iHq9XyotXzAAJNqPoonae8Ea85Vmb58BWHsXcEG31tZEHaX2yvMOFbwINg2j5yANiIMdTtdfPnJ3rKCS0jWovnGUgCTLYTxF',
                  });
              print(request.body);
              print(request.statusCode);
            });
          },
          child: const Text("Send Notification"),
        ),
      ),
    );
  }
}
