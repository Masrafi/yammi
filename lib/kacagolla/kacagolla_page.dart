import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'kacagolla_page_desktop.dart';
import 'kacagolla_page_mobile.dart';

class Kacagolla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: KacagollaPageMobile(),
      desktop: KacagollaPageDesktop(),
    );
  }
}
