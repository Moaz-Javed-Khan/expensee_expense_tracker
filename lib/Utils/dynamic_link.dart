import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  Future<String> createLink(String refCode) async {
    final String url = "https://com.example.expensee?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      androidParameters: const AndroidParameters(
        packageName: "com.example.expensee",
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.example.expensee",
        minimumVersion: "0",
      ),
      link: Uri.parse(url),
      uriPrefix: "https://expensee.page.link",
    );

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;

    final reflink = await link.buildShortLink(parameters);

    return reflink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;

      Share.share("hehe ${refLink.queryParameters["ref"]}");
    }
  }
}
