import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'rosomunjuri_page_desktop.dart';
import 'rosomunjuri_page_mobile.dart';

class Rosomunjuri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RosomunjuriPageMobile(),
      desktop: RosomunjuriPageDesktop(),
    );
  }
}
