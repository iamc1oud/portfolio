import 'package:flutter/material.dart';
import 'package:myapp/views/screen/contact_me/contact_desktop.dart';
import 'package:myapp/views/screen/contact_me/contact_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: ContactDesktop(),
      mobile: ContactMobile(),
    );
  }
}
