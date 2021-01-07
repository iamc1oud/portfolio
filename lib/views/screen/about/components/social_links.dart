import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:js' as js;

class SocialLink extends StatelessWidget {
  final String url;
  final Icon icon;

  const SocialLink({Key key, this.url, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [url]);
      },
      child: Container(
        child: icon,
      ),
    );
  }
}
